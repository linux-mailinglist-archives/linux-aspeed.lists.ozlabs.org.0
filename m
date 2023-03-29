Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F666CD4C5
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Mar 2023 10:37:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pmg010H1Gz3cdJ
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Mar 2023 19:37:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p2o7Lkjv;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p2o7Lkjv;
	dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pmfzw53VKz3cNj
	for <linux-aspeed@lists.ozlabs.org>; Wed, 29 Mar 2023 19:36:59 +1100 (AEDT)
Received: by mail-lj1-x231.google.com with SMTP id h9so15272521ljq.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 29 Mar 2023 01:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680079013;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M/xTfrQqdPOr1VUHDT+Xi7DQz6WS1kxLC72o+Ktlx4I=;
        b=p2o7LkjvWeqhqR1RKjzxBfXlcfSihucbat9diMVrvSv1WD6n2m2KAqwcWb80HfmP+y
         lKhKbl4FsRTq/u4Q8GMBGoqANkJseRef84IcyepO7CqkYgr0M7QHDfwWuHZAkQ5gWQYB
         tWrCJFcdSjk2I4Vumg3FQ3x5dXkH2Ht8KE/rp7R+LqZ7YBsH+AOoDX4A8NqXoE4FoqRC
         micX1WTx9Kreb0JbAF+IBhITjORuKQY3d0iO4edSlYrEn1Y2XJtCuxhmxn/mh5P0xNDB
         Dq6xvvB1EsWvD8vwLF/by8C5BkOptxQlTaz4eXg8q+DVcqxgAk3bhvuz8thicLLxm+mO
         aNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680079013;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M/xTfrQqdPOr1VUHDT+Xi7DQz6WS1kxLC72o+Ktlx4I=;
        b=T262wMKl1qmrEZ44tuIYuQ1qKDau0HaQCXgSe/JLIEY1zPMWX3I+kpcrSZSRB687A2
         GKwG11mM8Bxn27tadb1WmbSaRDaGAOXGdpV0z3cA3zth1Yr5K+6SmHZBsC1bxvwiDJ4i
         LFpARg2a+vEOpRg8hVhrsOrI7s3xkTyl+91mFTGfXVZ4sf3TgerXko5WPv5Kuj+fT15w
         L8dJIuyEFG62NoFvb6ZgIJ6YarUH3IwkYZq+tX4FrtIsl4y0qQ8yUH74o+ESDreHbPho
         XkwDjy0nCd2lyy7QoOT9AwkRC/x2/q5UqLYakmDYfIEi1o1VdAZaNuwqfE9EnOqkHHgX
         OqYw==
X-Gm-Message-State: AAQBX9cQScv0Ul8PBN6iT8Vg9csmGmuClUqB2LjQb50t5gmwZvuopyWx
	QKEcWkqHgCCSP+R/xiJLghnPwQ==
X-Google-Smtp-Source: AKy350au2Z3WXceuIA+YYWZfaLMQVGEW7Enc0KrPMuuwmNNa7EeF+qBAEs5vHu4zkzvycHr2enqaEg==
X-Received: by 2002:a2e:a48e:0:b0:290:8289:8cba with SMTP id h14-20020a2ea48e000000b0029082898cbamr434794lji.8.1680079013617;
        Wed, 29 Mar 2023 01:36:53 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id n1-20020ac24901000000b004eb0c18efc2sm1712311lfi.221.2023.03.29.01.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 01:36:53 -0700 (PDT)
Message-ID: <b66f708c-5369-c1c9-5506-c609a245bf4c@linaro.org>
Date: Wed, 29 Mar 2023 10:36:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 1/2] ARM: dts: aspeed: greatlakes: Add gpio names
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20230329083235.24123-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230329083235.24123-2-Delphine_CC_Chiu@Wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230329083235.24123-2-Delphine_CC_Chiu@Wiwynn.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 29/03/2023 10:32, Delphine CC Chiu wrote:
> From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> 
> Add GPIO names for SOC lines.
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../dts/aspeed-bmc-facebook-greatlakes.dts    | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
> index 8c05bd56ce1e..59819115c39d 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
> @@ -238,4 +238,53 @@
>  &gpio0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpiu1_default &pinctrl_gpiu7_default>;
> +	status = "okay";

Was it disabled before?

> +	gpio-line-names =
> +	/*A0-A7*/ "","","","","","","","",
> +	/*B0-B7*/ "power-bmc-nic","presence-ocp-debug",
> +		  "power-bmc-slot1","power-bmc-slot2",
> +		  "power-bmc-slot3","power-bmc-slot4","","",
> +	/*C0-C7*/ "presence-ocp-nic","","","reset-cause-nic-primary",
> +		  "reset-cause-nic-secondary","","","",
> +	/*D0-D7*/ "","","","","","","","",
> +	/*E0-E7*/ "","","","","","","","",
> +	/*F0-F7*/ "slot1-bmc-reset-button","slot2-bmc-reset-button",
> +		  "slot3-bmc-reset-button","slot4-bmc-reset-button",
> +		  "","","","presence-emmc",
> +	/*G0-G7*/ "","","","","","","","",
> +	/*H0-H7*/ "","","","",
> +		  "presence-mb-slot1","presence-mb-slot2",
> +		  "presence-mb-slot3","presence-mb-slot4",
> +	/*I0-I7*/ "","","","","","","bb-bmc-button","",
> +	/*J0-J7*/ "","","","","","","","",
> +	/*K0-K7*/ "","","","","","","","",
> +	/*L0-L7*/ "","","","","","","","",
> +	/*M0-M7*/ "","power-nic-bmc-enable","","usb-bmc-enable","","reset-cause-usb-hub","","",
> +	/*N0-N7*/ "","","","","bmc-ready","","","",
> +	/*O0-O7*/ "","","","","","","fan0-bmc-cpld-enable","fan1-bmc-cpld-enable",
> +	/*P0-P7*/ "fan2-bmc-cpld-enable","fan3-bmc-cpld-enable",
> +		  "reset-cause-pcie-slot1","reset-cause-pcie-slot2",
> +		  "reset-cause-pcie-slot3","reset-cause-pcie-slot4","","",
> +	/*Q0-Q7*/ "","","","","","","","",
> +	/*R0-R7*/ "","","","","","","","",
> +	/*S0-S7*/ "","","power-p5v-usb","presence-bmc-tpm","","","","",
> +	/*T0-T7*/ "","","","","","","","",
> +	/*U0-U7*/ "","","","","","","","GND",
> +	/*V0-V7*/ "bmc-slot1-ac-button","bmc-slot2-ac-button",
> +		  "bmc-slot3-ac-button","bmc-slot4-ac-button",
> +		  "","","","",
> +	/*W0-W7*/ "","","","","","","","",
> +	/*X0-X7*/ "","","","","","","","",
> +	/*Y0-Y7*/ "","","","reset-cause-emmc","","","","",
> +	/*Z0-Z7*/ "","","","","","","","";
> +};
> +
> +&gpio1 {
> +	status = "okay";

Same question...
Best regards,
Krzysztof

