Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3CA69DD05
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Feb 2023 10:39:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLZ453tLkz3bgs
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Feb 2023 20:39:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gVx+ZHoI;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gVx+ZHoI;
	dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLZ403pMnz30Jy
	for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Feb 2023 20:38:54 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id eg37so10727879edb.12
        for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Feb 2023 01:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wg66CfuIDc2OuZeNGh2hxzTF5J8r4gXE6jaKHzpsbgg=;
        b=gVx+ZHoIXuiJ/yI2bXys1rL+uYqIOaaIUHYeTCTu7m71j44xfaTvLCpq1fyezMcpS1
         lgHwx8NT+9indbUT49McRzIfAihmwCAs+BlooJpTZVgQcdtMbY9KspGejM7H1hp5clmq
         J5urJVP2Mq7gYvTrjcHEXVkpobU5VnrObyPobeUADBLtILpXXDHar5MPQJ5suleG2/i5
         It+dKDy8wa+y+WdTLoqvh18pp1nwrWePnXJ1HVL9m7qKeI/AuyZwU1MHkPCbr9jUq8pq
         BUEvvah+s6Ta+cRLWU6hxjw7BcfQpewQlldzgPnVj/2T6h/fSvNC5NXfVj4SAXS/EwZY
         6OkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wg66CfuIDc2OuZeNGh2hxzTF5J8r4gXE6jaKHzpsbgg=;
        b=6+PQNM84MixOAf00KRz77kf9hqxISC3jJ1eoccN+HbaEBTVGCum3x/n8mVGDdKMDPf
         sbaLZT38kfq06B42ZbWxd5Mybf9M2GamWipu7AaHUSpDPWMj7wabVteeZpQ8WsYWTRKB
         WVjnyOWVjkk9Xz4u53N8/5cBEEN8rTAfXO+xNkrlFyIeUf3ulGItdxmYAB3j6oACzqyw
         RBzYlUbY3ZBphyh230eV2rn/66AvG0i7ulFnHrosDvf7EcSExTtIYo8ULin3wFczi21k
         CFXIVAV2HTdacYSx3l81pQerxRQSP+Ra1Tzv13uMjWGt/BIiM3EHReWFBfOAyVSRyJgi
         3OhA==
X-Gm-Message-State: AO0yUKW+T3vtDdZGOFMT0n6GCtsrRppguJAWoeU1fTz1Pv5e1+RL+njy
	m01gGhm9qyR7M5AirrYrhuvfug==
X-Google-Smtp-Source: AK7set+x/ydQXHH54gXhy2ZLyR0nq67hV8gpFBFqoGpKV2tPN4Rzk9wZ1WZxtVH6w044XbkXuXEMnw==
X-Received: by 2002:a05:6402:1108:b0:4ab:d0e0:a64 with SMTP id u8-20020a056402110800b004abd0e00a64mr3155003edv.19.1676972330839;
        Tue, 21 Feb 2023 01:38:50 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y6-20020a50ce06000000b004acc6c67089sm2485412edi.75.2023.02.21.01.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 01:38:50 -0800 (PST)
Message-ID: <1f0b18b1-0fe4-a7e9-4d72-3938471ead42@linaro.org>
Date: Tue, 21 Feb 2023 10:38:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 0/2] Add ASPEED AST2600 I2Cv2 controller driver
Content-Language: en-US
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
 <54ef0dee-30dc-3ba9-d2f7-8270204b5505@linaro.org>
 <TYZPR06MB5274195CB92C4604280A776EF2A49@TYZPR06MB5274.apcprd06.prod.outlook.com>
 <abec828b-9b34-fc5a-cd36-8be6f20dfd25@linaro.org>
 <TYZPR06MB52743FC4ED5ED152446106ABF2A59@TYZPR06MB5274.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TYZPR06MB52743FC4ED5ED152446106ABF2A59@TYZPR06MB5274.apcprd06.prod.outlook.com>
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

On 21/02/2023 02:12, Ryan Chen wrote:
>> Yes. New compatible and new syscon phandle (constrained to specific
>> compatibles in allOf:if:then:) to the old binding.
> Thank your guidance.
> The following is my sample modify, if my understand is correct, I will update in patch1 thread discussion.
> I need add in original aspeed,i2c.yaml not aspeed,i2cv2.yaml
> allOf:
>   - $ref: /schemas/i2c/i2c-controller.yaml#
>   - if:
>       properties:
>         compatible:
>           contains:
>             const: aspeed,ast2600-i2cv2
> 
>     then:
>       required:
>         - aspeed,gr

else:
  properties:
    aspeed,gr: false

Best regards,
Krzysztof

