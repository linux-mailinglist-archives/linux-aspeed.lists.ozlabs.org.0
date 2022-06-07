Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E9E53F314
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Jun 2022 02:51:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHBcr2J0hz3bcZ
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Jun 2022 10:51:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=MmasGyKF;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=MmasGyKF;
	dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHBcm0Rvtz2yg5
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Jun 2022 10:51:19 +1000 (AEST)
Received: from [192.168.87.104] (unknown [50.47.106.71])
	by linux.microsoft.com (Postfix) with ESMTPSA id 87E1320BE625;
	Mon,  6 Jun 2022 17:50:46 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 87E1320BE625
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1654563047;
	bh=mNIWq9mEXLrb2v1fqG+qEYhLSaH2HfCn23YiIjp/ozs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MmasGyKFt3+ENYRwLKiFpoiehKjYBtnkFGsVFLDwFYkPbHgu4xCmT9g3LpBW98z80
	 QZqERPjYGTiFrDX5ozdsaBbkYtYsVNQW2IAFvxy8LczsPaFDWcNSo+EoVpO3wT/ykY
	 tQ2GxmhBC/gs2UkznfLjNQ6TI1QR9WyzwWInZ7lc=
Message-ID: <bba832ec-ea64-71db-385a-ab9816e7239c@linux.microsoft.com>
Date: Mon, 6 Jun 2022 17:50:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 3/5] ARM: dts: aspeed: Add HACE device controller node
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Johnny Huang <johnny_huang@aspeedtech.com>
References: <20220606064935.1458903-1-neal_liu@aspeedtech.com>
 <20220606064935.1458903-4-neal_liu@aspeedtech.com>
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
In-Reply-To: <20220606064935.1458903-4-neal_liu@aspeedtech.com>
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

On 6/5/2022 11:49 PM, Neal Liu wrote:
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 3d5ce9da42c3..371d2a6b56ef 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -304,6 +304,14 @@ apb {
>   			#size-cells = <1>;
>   			ranges;
>   
> +			hace: crypto@1e6d0000 {
> +				compatible = "aspeed,ast2600-hace";
> +				reg = <0x1e6d0000 0x200>;
> +				interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&syscon ASPEED_CLK_GATE_YCLK>;
> +				resets = <&syscon ASPEED_RESET_HACE>;

Shouldn't the left side be also 'crypto', see existing crypto nodes in 
arch/arm64/dts for example.

			crypto: crypto@1e6d0000 {
				...

Regards,
Dhananjay
