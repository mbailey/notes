# prompt is too long - summarizer unexpectedly failed for all models

```
Readonly: conventions/CONVENTIONS.md conventions/questions.md                                                                           
architect> litellm.BadRequestError: litellm.ContextWindowExceededError: AnthropicError - {"type":"error","error":{"type":"invalid_request_error","message":"prompt is too long: 203298 tokens > 200000 maximum"}}
litellm.BadRequestError: litellm.ContextWindowExceededError: AnthropicError - {"type":"error","error":{"type":"invalid_request_error","message":"prompt is too long: 203298 tokens > 200000 maximum"}}                                                                          
summarizer unexpectedly failed for all models
```