import Web3 from 'web3'
import store from '../store'
import ContractInterface from '../build/contracts/Wikipedia.json'
import { connectEthereum } from '../store/reducers/root'

const connect = async dispatch => {
  if (window.ethereum) {
    window.web3 = new Web3(window.ethereum)
    try {
      const [account] = await window.ethereum.enable()
      const contract = new window.web3.eth.Contract(
        ContractInterface.abi,
        ContractInterface.networks['5777'].address,
        { from: account }
      )
      dispatch(connectEthereum({ account, contract }))
    } catch (error) {
      console.error(error)
    }
  } else {
    console.log('Not Dapp browser.')
  }
}

const createArticle = (content) => async dispatch => {
  if (content != null) {
    const { contract } = store.getState();
    await contract.methods.createArticle(content.toString()).send();
  }
}

const getArticle = (id) => async dispatch => {
  if (id != null && id >= 0) {
    const { contract } = store.getState();
    await contract.methods.articleContent(id.toInteger()).call();
  }
}


export { connect , createArticle}
