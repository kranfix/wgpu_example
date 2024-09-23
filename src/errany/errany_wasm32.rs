use thiserror::Error;

#[derive(Error, Debug)]
pub enum ErrAny {
    #[error("An error ocurred: {0})")]
    GenericError(String),
}

pub type Result<T> = std::result::Result<T, ErrAny>;
