Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C515655A650
	for <lists+linux-aspeed@lfdr.de>; Sat, 25 Jun 2022 05:29:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LVKGk4xkjz3cdv
	for <lists+linux-aspeed@lfdr.de>; Sat, 25 Jun 2022 13:29:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=OspP72b4;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=OspP72b4;
	dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LVKGf6GfGz3bqW
	for <linux-aspeed@lists.ozlabs.org>; Sat, 25 Jun 2022 13:29:14 +1000 (AEST)
Received: from [192.168.86.247] (23-119-123-228.lightspeed.sntcca.sbcglobal.net [23.119.123.228])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7234E20C7956;
	Fri, 24 Jun 2022 20:28:40 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7234E20C7956
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1656127721;
	bh=JQrEV25Qq2xdPblGSoG19vTOK76ID9Ode4ej2R5wAh8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OspP72b4TUDmYtGZoMOvxPICki6wwW3eHAaAo/JIHK4PRJagLc+N0v38EbMeQQMHE
	 GQmbi9VPrzmjZCQgEKjbZsfSqFXD6mjNCv52DKX+35DahzdvBxkqCAPz007w9QwIYP
	 Ov8ZnP1gQaUxChSEwjmi+22z47+4jZ4M51gTFSp4=
Message-ID: <3dde4d8e-5f97-dc07-1763-981942d23f12@linux.microsoft.com>
Date: Fri, 24 Jun 2022 20:28:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 0/5] Add Aspeed crypto driver for hardware acceleration
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Corentin Labbe <clabbe.montjoie@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Randy Dunlap <rdunlap@infradead.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Dhananjay Phadke <dhphadke@microsoft.com>,
 Johnny Huang <johnny_huang@aspeedtech.com>
References: <20220624090827.3909179-1-neal_liu@aspeedtech.com>
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
In-Reply-To: <20220624090827.3909179-1-neal_liu@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Neal,

On 6/24/2022 2:08 AM, Neal Liu wrote:
> Aspeed Hash and Crypto Engine (HACE) is designed to accelerate the
> throughput of hash data digest, encryption and decryption.
> 
> These patches aim to add Aspeed hash & crypto driver support.
> The hash & crypto driver also pass the run-time self tests that
> take place at algorithm registration.
> 
> Tested-by below configs:
> - CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
> - CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y
> - CONFIG_DMA_API_DEBUG=y
> - CONFIG_DMA_API_DEBUG_SG=y
> - CONFIG_CPU_BIG_ENDIAN=y
> 
> Change since v3:
> - Use dmam_alloc_coherent() instead to manage dma_alloc_coherent().
> - Add more error handler of dma_prepare() & crypto_engine_start().
> 
> Change since v2:
> - Fix endianness issue. Tested on both little endian & big endian
>    system.
> - Use common crypto hardware engine for enqueue & dequeue requests.
> - Use pre-defined IVs for SHA-family.
> - Revise error handler flow.
> - Fix sorts of coding style problems.
> 
> Change since v1:
> - Add more error handlers, including DMA memory allocate/free, DMA
>    map/unmap, clock enable/disable, etc.
> - Fix check dma_map error for config DMA_API_DEBUG.
> - Fix dt-binding doc & dts node naming.
> 
> 
> Neal Liu (5):
>    crypto: aspeed: Add HACE hash driver
>    dt-bindings: clock: Add AST2600 HACE reset definition
>    ARM: dts: aspeed: Add HACE device controller node
>    dt-bindings: crypto: add documentation for aspeed hace
>    crypto: aspeed: add HACE crypto driver

The driver claims compatible with aspeed,ast2500-hace, but there's no
equivalent g5 DTS change (patch 3/5) or reset definition (patch 2/5) in
aspeed-clock.h? Either drop ast2500 compatible from this patch series or 
fix these.

Thanks,
Dhananjay
