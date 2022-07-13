Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 712C7572F8E
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Jul 2022 09:48:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjV9h74VTz3c3t
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Jul 2022 17:48:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=P6+Zhlbq;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=P6+Zhlbq;
	dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjV9c2s1Vz30Lb
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Jul 2022 17:48:36 +1000 (AEST)
Received: from [192.168.87.140] (unknown [50.47.106.71])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9B42E204DE8E;
	Wed, 13 Jul 2022 00:48:04 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9B42E204DE8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1657698485;
	bh=KZ3W7Lm0ppPu0mxu7WcxzkIS3QqQzFKigKl1JQiFt2Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P6+Zhlbq0DMsnVL+ep7Gw05EZe/vUerKqkJmmAvdzE0pSRyQXm6vhKjOFnTdc84dI
	 Wr5o/o68+rQ16YtPQgftXDkZ3oY7JvtHA9SjKygZ+43CrDgiRDmcJS/qnvQ8OjqHRv
	 Hs3mxf8ksl5o7PzzC4HWh10dRPhLpoAdGUpHVLUs=
Message-ID: <e5c47d13-bbb9-e607-47cb-6bf4cf6bebd9@linux.microsoft.com>
Date: Wed, 13 Jul 2022 00:48:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 3/5] ARM: dts: aspeed: Add HACE device controller node
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
References: <20220705020936.1751771-1-neal_liu@aspeedtech.com>
 <20220705020936.1751771-4-neal_liu@aspeedtech.com>
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
In-Reply-To: <20220705020936.1751771-4-neal_liu@aspeedtech.com>
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

On 7/4/2022 7:09 PM, Neal Liu wrote:
> Add hace node to device tree for AST2500/AST2600.
> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
> ---
>   arch/arm/boot/dts/aspeed-g5.dtsi | 8 ++++++++
>   arch/arm/boot/dts/aspeed-g6.dtsi | 8 ++++++++
>   2 files changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index c89092c3905b..04f98d1dbb97 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -262,6 +262,14 @@ rng: hwrng@1e6e2078 {
>   				quality = <100>;
>   			};
>   
> +			hace: crypto@1e6e3000 {
> +				compatible = "aspeed,ast2500-hace";
> +				reg = <0x1e6e3000 0x100>;
> +				interrupts = <4>;
> +				clocks = <&syscon ASPEED_CLK_GATE_YCLK>;
> +				resets = <&syscon ASPEED_RESET_HACE>;
> +			};
> +
>   			gfx: display@1e6e6000 {
>   				compatible = "aspeed,ast2500-gfx", "syscon";
>   				reg = <0x1e6e6000 0x1000>;
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 6660564855ff..095cf8d03616 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -323,6 +323,14 @@ apb {
>   			#size-cells = <1>;
>   			ranges;
>   
> +			hace: crypto@1e6d0000 {
> +				compatible = "aspeed,ast2600-hace";
> +				reg = <0x1e6d0000 0x200>;
> +				interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&syscon ASPEED_CLK_GATE_YCLK>;
> +				resets = <&syscon ASPEED_RESET_HACE>;
> +			};
> +


Thank you for addressing ast2500, for this patch -

Reviewed-by: Dhananjay Phadke <dphadke@linux.microsoft.com>
