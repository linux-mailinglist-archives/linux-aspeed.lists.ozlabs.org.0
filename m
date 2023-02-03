Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C7E688CA0
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Feb 2023 02:36:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7JCy3L4Lz3f5y
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Feb 2023 12:36:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=IQ9KW2u+;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=IQ9KW2u+;
	dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7JCp2TXbz3bjy
	for <linux-aspeed@lists.ozlabs.org>; Fri,  3 Feb 2023 12:36:38 +1100 (AEDT)
Received: from [192.168.87.25] (unknown [50.35.78.176])
	by linux.microsoft.com (Postfix) with ESMTPSA id DE06D20B7102;
	Thu,  2 Feb 2023 17:36:05 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DE06D20B7102
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1675388166;
	bh=uqFp07G5WGJwzKMyQ/L163FV3SqQaEfZIf2xxupW+nM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IQ9KW2u+8LZQ4MyxGsFFXhzh8OG+Xl/CMDe7QDDUM/Xb72rDgKmKokTn6KSWLO6dS
	 o6wAkcRuXVWsDsUkOitQUXw2bCE2cnlsDSwAkTmskWFwZRoL/S5nwGlMWXnoUAFWc3
	 TnWOmz7QtyQZSYDRnBkD5r33Z1ZNqWRpiF7AGq3Y=
Message-ID: <e2dd4a02-12cb-de5e-4b64-9d6a4a1ad316@linux.microsoft.com>
Date: Thu, 2 Feb 2023 17:36:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 -next] crypto: aspeed: fix type warnings
To: Neal Liu <neal_liu@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>
References: <20230202070345.191514-1-neal_liu@aspeedtech.com>
Content-Language: en-US
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
In-Reply-To: <20230202070345.191514-1-neal_liu@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 2/1/2023 11:03 PM, Neal Liu wrote:
> This patch fixes following warnings:
> 
> 1. sparse: incorrect type in assignment (different base types)
> Fix: change to __le32 type.
> 2. sparse: cast removes address space '__iomem' of expression
> Fix: use readb to avoid dereferencing the memory.
> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> ---
> Change since v1: keep iomem marker to remain its purpose.
> 
>   drivers/crypto/aspeed/aspeed-acry.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/crypto/aspeed/aspeed-acry.c b/drivers/crypto/aspeed/aspeed-acry.c
> index 164c524015f0..f2429e699d14 100644
> --- a/drivers/crypto/aspeed/aspeed-acry.c
> +++ b/drivers/crypto/aspeed/aspeed-acry.c
> @@ -252,7 +252,7 @@ static int aspeed_acry_rsa_ctx_copy(struct aspeed_acry_dev *acry_dev, void *buf,
>   				    enum aspeed_rsa_key_mode mode)
>   {
>   	const u8 *src = xbuf;
> -	u32 *dw_buf = (u32 *)buf;
> +	__le32 *dw_buf = (__le32 *)buf;

All callers are passing acry_dev->buf_addr as buf, can just change that 
type to __le32 * and deref here directly?

>   	int nbits, ndw;
>   	int i, j, idx;
>   	u32 data = 0;
> @@ -302,7 +302,7 @@ static int aspeed_acry_rsa_ctx_copy(struct aspeed_acry_dev *acry_dev, void *buf,
>   static int aspeed_acry_rsa_transfer(struct aspeed_acry_dev *acry_dev)
>   {
>   	struct akcipher_request *req = acry_dev->req;
> -	u8 *sram_buffer = (u8 *)acry_dev->acry_sram;
> +	u8 __iomem *sram_buffer = (u8 __iomem *)acry_dev->acry_sram;

u8 cast seems unnecessary, readb takes (void *) and using "+ data_idx"
offset below anyway.


>   	struct scatterlist *out_sg = req->dst;
>   	static u8 dram_buffer[ASPEED_ACRY_SRAM_MAX_LEN];
>   	int leading_zero = 1;
> @@ -321,11 +321,11 @@ static int aspeed_acry_rsa_transfer(struct aspeed_acry_dev *acry_dev)
>   
>   	for (j = ASPEED_ACRY_SRAM_MAX_LEN - 1; j >= 0; j--) {
>   		data_idx = acry_dev->data_byte_mapping[j];
> -		if (sram_buffer[data_idx] == 0 && leading_zero) {
> +		if (readb(sram_buffer + data_idx) == 0 && leading_zero) {
>   			result_nbytes--;
>   		} else {
>   			leading_zero = 0;
> -			dram_buffer[i] = sram_buffer[data_idx];
> +			dram_buffer[i] = readb(sram_buffer + data_idx);
>   			i++;
>   		}
>   	}

