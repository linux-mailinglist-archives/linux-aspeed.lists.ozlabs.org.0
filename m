Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ECE668AB3
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Jan 2023 05:13:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtShl6PNmz3fBQ
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Jan 2023 15:13:43 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=216.24.177.18; helo=formenos.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=<UNKNOWN>)
Received: from formenos.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtShg3q67z3bpH
	for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Jan 2023 15:13:37 +1100 (AEDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pGBRM-00H5Jc-38; Fri, 13 Jan 2023 12:13:17 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 13 Jan 2023 12:13:16 +0800
Date: Fri, 13 Jan 2023 12:13:16 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH v5 0/4] Add Aspeed ACRY driver for hardware acceleration
Message-ID: <Y8DaXA9X5Rp+3jCA@gondor.apana.org.au>
References: <20230104013436.203427-1-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104013436.203427-1-neal_liu@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jan 04, 2023 at 09:34:32AM +0800, Neal Liu wrote:
> Aspeed ACRY engine is designed to accelerate the throughput of
> ECDSA/RSA signature and verification.
> 
> These patches aim to add Aspeed ACRY RSA driver support.
> This driver also pass the run-time self tests that take place at
> algorithm registration on both big-endian/little-endian system
> in AST2600 evaluation board .
> 
> Tested-by below configs:
> - CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
> - CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y
> - CONFIG_DMA_API_DEBUG=y
> - CONFIG_DMA_API_DEBUG_SG=y
> - CONFIG_CPU_BIG_ENDIAN=y
> 
> Change since v4:
> - Remove GFP_DMA flag since it's unnecessary.
> 
> Change since v3:
> - Revise aspeed,ast2600-ahbc.yaml dt-bindings description.
> 
> Change since v2:
> - Fix format and uninitialized warning.
> - Revise binding description.
> 
> Change since v1:
> - Fix dt-bindings description.
> - Refine the Makefile which has been addressed.
> 
> Neal Liu (4):
>   crypto: aspeed: Add ACRY RSA driver
>   ARM: dts: aspeed: Add ACRY/AHBC device controller node
>   dt-bindings: crypto: add documentation for Aspeed ACRY
>   dt-bindings: bus: add documentation for Aspeed AHBC
> 
>  .../bindings/bus/aspeed,ast2600-ahbc.yaml     |  37 +
>  .../bindings/crypto/aspeed,ast2600-acry.yaml  |  49 ++
>  MAINTAINERS                                   |   2 +-
>  arch/arm/boot/dts/aspeed-g6.dtsi              |  13 +
>  drivers/crypto/aspeed/Kconfig                 |  11 +
>  drivers/crypto/aspeed/Makefile                |   2 +
>  drivers/crypto/aspeed/aspeed-acry.c           | 828 ++++++++++++++++++
>  7 files changed, 941 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml
>  create mode 100644 Documentation/devicetree/bindings/crypto/aspeed,ast2600-acry.yaml
>  create mode 100644 drivers/crypto/aspeed/aspeed-acry.c
> 
> -- 
> 2.25.1

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
