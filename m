Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDD857B496
	for <lists+linux-aspeed@lfdr.de>; Wed, 20 Jul 2022 12:36:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnsZS685rz3bmG
	for <lists+linux-aspeed@lfdr.de>; Wed, 20 Jul 2022 20:36:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fkB0BJqf;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fkB0BJqf;
	dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnsZN3CBcz3053
	for <linux-aspeed@lists.ozlabs.org>; Wed, 20 Jul 2022 20:36:42 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id m9so17973316ljp.9
        for <linux-aspeed@lists.ozlabs.org>; Wed, 20 Jul 2022 03:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=eOQs/h3TvmwMGsHYWl9U3/WtYoMV9gdMa1dgDXwlbSQ=;
        b=fkB0BJqfPCtZaMfiYdGb3bdOxfiLSBeYykX2v5HfeUI0qT9RCYWjYKZwN2H2/Lcklg
         5AtcySUHDocU/gfgqQ6VWa5vXLUeoBByLaXwcyqmEMHN/lC6o1LBfrPHatb2VG1Eheoj
         uLEPyQzCB8wzzWwIqTO9fAzIK81bYmX8sZuKQn2O6Eqk08vYjGUGX0zg1BDxszd2cGwH
         BJHeSB3ql3PnNoCjParSAlqbboMcvdkkApwZgirbZGwvTV8dh4aky4QdjnMkgpQ2pCFD
         mUH0PJziq/T1HRPDay71Oiw5Rxu6yMU2spGr7/T+3+rh0cKImMnmNv8XOtmuAJk5lfk4
         QQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eOQs/h3TvmwMGsHYWl9U3/WtYoMV9gdMa1dgDXwlbSQ=;
        b=RB2S3rcvv0IqHB81Mq4C83Atgy1nw47Opcd66B02iIEbbe8ecfEKnQP2o8LYWCzIMm
         Bmv1c6M9oF0610+c2OrNnmOiA95B9Ptrq6p5FX9ynogxObPyLn89aet+W20yYuigvjB8
         ggT48u9U+Ows4XIXWxo1Ulfluu0gJXdN+JtmoFspl2bsItu6FQGzAksSs/dMoZyEGbSu
         vvn4ztNtAUPfRnpp73YuVDZgfx5gmDZwcKzPaQP+sTn+pdkyjZItg+2EtSfYl9uN7PWm
         d4KL5V1ZODefy7UKUJQVhFAAYrfG50pxQ4xB/jjuo+ep7IqnyNlGutXFrGltgWP/ZAPF
         WqcQ==
X-Gm-Message-State: AJIora/Wg/UxJMFwJZH5Is0R4sUBxwjxTlOjxyjESKxrJoQl16yS+Ktx
	t8ROleQaloImfrMrkvx3YHXwkg==
X-Google-Smtp-Source: AGRyM1shKllIGiUnXHGiJLH6+O6rAfySNJxSL+EK7w+lV4RU9sESPdtwOwhOZz2Yrya3DaMVYGje0w==
X-Received: by 2002:a2e:a788:0:b0:25d:94fd:1a84 with SMTP id c8-20020a2ea788000000b0025d94fd1a84mr14986884ljf.177.1658313398531;
        Wed, 20 Jul 2022 03:36:38 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id d29-20020a0565123d1d00b0047255d21124sm3752136lfv.83.2022.07.20.03.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 03:36:38 -0700 (PDT)
Message-ID: <ab78f85c-dd0a-9176-103f-8e4abe01b8f9@linaro.org>
Date: Wed, 20 Jul 2022 12:36:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Mitchell BMC
Content-Language: en-US
To: Quan Nguyen <quan@os.amperecomputing.com>, openbmc@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Open Source Submission <patches@amperecomputing.com>
References: <20220720085230.3801945-1-quan@os.amperecomputing.com>
 <20220720085230.3801945-3-quan@os.amperecomputing.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720085230.3801945-3-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: thang@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 20/07/2022 10:52, Quan Nguyen wrote:
> The Mt. Mitchell BMC is an ASPEED AST2600-based BMC for the Mt. Mitchell
> hardware reference platform with AmpereOne(TM) processor.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
> Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
> ---
> v2 :
>   + Remove bootargs                                       [Krzysztof]
>   + Fix gpio-keys nodes name to conform with device tree binding
>   documents                                               [Krzysztof]
>   + Fix some nodes to use generic name                    [Krzysztof]
>   + Remove unnecessary blank line                         [Krzysztof]
>   + Fix typo "LTC" to "LLC" in license info and corrected license
>   info to GPL-2.0-only
> 
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 577 ++++++++++++++++++
>  2 files changed, 578 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> 

(...)

> +
> +&i2c3 {
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +
> +	adc_i2c: adc-i2c@16 {

Node name: just "adc"

> +		compatible = "lltc,ltc2497";
> +		reg = <0x16>;
> +		vref-supply = <&voltage_mon_reg>;
> +		#io-channel-cells = <1>;
> +		status = "okay";

Isn't this new node? Why do you need status here?

> +	 };
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c64";
> +		reg = <0x50>;
> +		pagesize = <32>;
> +	};
> +

(...)

> +
> +&gpio1 {
> +	gpio-line-names =
> +	/*18A0-18A7*/	"","","","","","","","",
> +	/*18B0-18B7*/	"","","","","emmc-rst-n","","s0-soc-pgood","",
> +	/*18C0-18C7*/	"uart1-mode0","uart1-mode1","uart2-mode0","uart2-mode1",
> +			"uart3-mode0","uart3-mode1","uart4-mode0","uart4-mode1",
> +	/*18D0-18D7*/	"","","","","","","","",
> +	/*18E0-18E3*/	"","","","";
> +};
> +

You have a trailing line error.


Best regards,
Krzysztof
