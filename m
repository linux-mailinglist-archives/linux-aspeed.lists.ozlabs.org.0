Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1C155B8F4
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Jun 2022 11:35:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWjJD64W4z3bx8
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Jun 2022 19:35:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WdWufUdu;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WdWufUdu;
	dkim-atps=neutral
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWjJ86JZKz307g
	for <linux-aspeed@lists.ozlabs.org>; Mon, 27 Jun 2022 19:35:19 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id ge10so17863685ejb.7
        for <linux-aspeed@lists.ozlabs.org>; Mon, 27 Jun 2022 02:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TeN/iwsTV4FhP/OywXKY/fx1M3aFIWw7RCkbflk2R9o=;
        b=WdWufUduLcKXBmqthhLKerQLhk1pUFi7XWTD9qKZ3PlDx5Y7FjMPp8ypB8pn82kYKi
         BWSaxzMgNqx9STnQ46/HTMxh014kcmYRTqsqAQ08HNwys5PInRLlaxCG7RqB2iU3/pQK
         Y3UHsv5GwvBYbZdrNKivf/IuS2O6MgYLqD08RMXgfElnyrjg+waj73Eseg3z+rGjdnkM
         A5Ec6P/315Yqt3hvigPyvgpTsZtqSSM+S7JoXw2IUzApO34x6jRHqwaTk4bk7podakac
         ESSpBJdo7E1FoMYDyDkzql1ExNYhOqa4sVgaUB31NUnwCifu/DcaIfCxeWsEPjwBizit
         QkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TeN/iwsTV4FhP/OywXKY/fx1M3aFIWw7RCkbflk2R9o=;
        b=MDSjHvTk5bRbz4ojwSaDc8cdBg7LvKmdkVoFRR8/ctZRDvujYiHHZwgk6NfTLJ6BtU
         EsDIrJJB6dl9DDPPp+dzabk6bP84FIHpc4pUenn9oObPUYRIx9sknE+o+VjTxAkIfIRG
         ZKOkJsux2xdJJF41sKPAw38qQpAxChdz4pgPbvtAaunxW1mxFEFBx+w71LYxEIOLqEVU
         e+wu8CFgARe9tMTQIqWFlXx8dRnHDffkT/wCbVoSRx+bznCTFuKTxizOIDeqjpJ75oTD
         TUPhXAub1Pr/VrPsGP6V8Pp2fFC2MrW+7o4QAXqxynCvI8rwtjk/AtiEoPjlZMxSSmCs
         fXFw==
X-Gm-Message-State: AJIora8INN22wcKM4I8VGJKfXsrm1TTvONsAuy3HzNe2SjiZBvITatv1
	i2Rux+eDotOH07XW1NGjSDlNcg==
X-Google-Smtp-Source: AGRyM1uTdIi0aYEYixohA+nAVSHM9M59wtJB/1A4P8XfRZh7rsryDIKZ3vrVQ13PulLSe/wHT/dBAg==
X-Received: by 2002:a17:907:62a9:b0:726:2a3b:8507 with SMTP id nd41-20020a17090762a900b007262a3b8507mr12026191ejc.666.1656322516674;
        Mon, 27 Jun 2022 02:35:16 -0700 (PDT)
Received: from [192.168.0.247] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z21-20020a170906815500b00722e7e26d22sm4812672ejw.58.2022.06.27.02.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 02:35:16 -0700 (PDT)
Message-ID: <aafd58d6-8705-96ee-7813-9b3bae7bb3d1@linaro.org>
Date: Mon, 27 Jun 2022 11:35:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ARM: dts: aspeed: Add device tree for Ampere's Mt.
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
References: <20220621092120.2427152-1-quan@os.amperecomputing.com>
 <97934f38-4da5-ab9e-7089-d6e48edd5e6a@linaro.org>
 <9120c167-38c2-f8c4-e039-4202d5844639@os.amperecomputing.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9120c167-38c2-f8c4-e039-4202d5844639@os.amperecomputing.com>
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
Cc: "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 27/06/2022 11:32, Quan Nguyen wrote:
>>> +
>>> +	ltc2497_reg: ltc2497_regulator {
>>
>> No underscores in node name, no specific names (Devicetree spec requires
>> generic), so ltc2497 has to go. You could add some more specific
>> prefix/suffix to describe the function.
>>
> This is to monitor peripheral voltage so it would be updated to:

But it is a regulator, not a voltage monitor, so the node name could be:
regulator-0
regulator-voltage-mon
voltage-mon-regulator

> 
>           voltage_monitor: voltage-monitor {
> 
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "ltc2497_reg";
>>> +		regulator-min-microvolt = <3300000>;
>>> +		regulator-max-microvolt = <3300000>;
>>> +		regulator-always-on;
>>> +	};
>>> +


Best regards,
Krzysztof
