Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5186569AA78
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Feb 2023 12:32:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ8nM1l2bz3f6C
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Feb 2023 22:32:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RZeDDAOH;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RZeDDAOH;
	dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ8nC3xZQz3bjW
	for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Feb 2023 22:32:47 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id m17so3593765edc.9
        for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Feb 2023 03:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NtPn4/xI7yqwIazolPw3ofvX5Wxk5SKUsFzeYA/r32E=;
        b=RZeDDAOH1v2odGYn1MOT4kO87CCkqtIyEfxoyFbqhVsY0tTLifsGibEavhmGVW//oP
         I/1Y5ctYALK7mJWpspSupQm3cng2RtspN7JCZcgNAS0gbdsg0wSQyPc0nwOMVAdXio8q
         c5FB4gpz+MCJ5K8wY7f9/u2wtNttXSwTmcg6DdCkJ/8z1J5HGLSLYdx/XjhpITQ83Di2
         9tCMAvpNiifSk6yQ+eS1qdGoi4g1HCk5OO9G0nXW0AbvpCvZMQUp/nqayoS72VcUtte8
         HR3GQ8CROa0rMYzZYkTVClREfAWgp92+34jI/nxPKGLV/dFqKjTGiXvn92FPGuyC1I64
         IerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NtPn4/xI7yqwIazolPw3ofvX5Wxk5SKUsFzeYA/r32E=;
        b=DaslUjIErJ7LH6oQim2rrbrn7rwtDJj2s1xEfedU/fo63RUs9DHgVC1Ku7gl9G7i0/
         0M/Ud/3dxigrm4sJHDhXiQKy63fyIbewpPk26zLeYGmsMAcSE80Jhp3h3s1MT1G4Hrs7
         Vl+5PL9EK8pXlBAfo1rHPUlQYkn9+Teg99iY373MxDLjCKhM482p0Xj+S9pk88DE6TSq
         B1OGx/V6E9z/5/K4NcmXR8W+LVgI8NCyUvdeguqqPoxFkLBs23WGQvY/FuqHovleIjdw
         VrhyAZtb7mJMI2L/E+SZ4AtISMkmjMPm7ftqoQcI8JJwiKx8O/PAzDMoriYwuHt4zpEu
         83vg==
X-Gm-Message-State: AO0yUKVryDtbCuaVop2PhK7uBZWG4lg6rILjQxi3FpW7RX6PKfpDStko
	fjSqVXwYVuLamETv13Mkrnx0KA==
X-Google-Smtp-Source: AK7set/dqNc4nmO8m/2hHFKBF6unWkZ80c7V4zsZlNnh2hhZVhuDW3B41WGCN/0b02DqNXV82H0zfQ==
X-Received: by 2002:a17:906:3418:b0:884:ab29:bd0b with SMTP id c24-20020a170906341800b00884ab29bd0bmr8819322ejb.69.1676633559377;
        Fri, 17 Feb 2023 03:32:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u28-20020a50a41c000000b004a0e2fe619esm2162487edb.39.2023.02.17.03.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 03:32:38 -0800 (PST)
Message-ID: <c594a426-9ad3-1f67-8261-4d2d68272870@linaro.org>
Date: Fri, 17 Feb 2023 12:32:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] ARM: dts: aspeed: mtmitchell: Enable NCSI
Content-Language: en-US
To: Chanh Nguyen <chanh@os.amperecomputing.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230217102122.16547-1-chanh@os.amperecomputing.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230217102122.16547-1-chanh@os.amperecomputing.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 17/02/2023 11:21, Chanh Nguyen wrote:
> Support the mac3 (RGMII4) as an NC-SI stack instead of an MDIO PHY.
> 
> The OCP slot #0 and OCP slot #1 use a common the BMC_NCSI signal,
> so we use only one of them at the same time. The OCP slot #0 will
> be enabled by PCA9539's setting by default.
> 
> Also, enable the OCP Auxiliary Power during booting.
> 
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> ---
>  .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 37 ++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> index 4b91600eaf62..e8a6b1f08d6a 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> @@ -251,6 +251,14 @@
>  	pinctrl-0 = <&pinctrl_rgmii1_default>;
>  };
>  
> +&mac3 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rmii4_default>;
> +	clock-names = "MACCLK", "RCLK";
> +	use-ncsi;
> +};
> +
>  &fmc {
>  	status = "okay";
>  	flash@0 {
> @@ -439,6 +447,26 @@
>  	status = "okay";
>  };
>  
> +&i2c8 {
> +	status = "okay";
> +
> +	pca9539@77 {

Node names should be generic, so I believe this is "gpio".
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Best regards,
Krzysztof

