Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DC96F2EBA
	for <lists+linux-aspeed@lfdr.de>; Mon,  1 May 2023 08:38:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q8tpF5X8Rz3c38
	for <lists+linux-aspeed@lfdr.de>; Mon,  1 May 2023 16:38:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dvctsZVx;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dvctsZVx;
	dkim-atps=neutral
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q8tp80WxBz2yV5
	for <linux-aspeed@lists.ozlabs.org>; Mon,  1 May 2023 16:38:38 +1000 (AEST)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-50a14564d17so36988236a12.0
        for <linux-aspeed@lists.ozlabs.org>; Sun, 30 Apr 2023 23:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682923113; x=1685515113;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q+38S76C5QyqUQMkBZ45R/3U43wsLQgBrGgiDB5lSCs=;
        b=dvctsZVxqA8lEJ6SW/AiJw7Xh4Z3orpVKD383bu7Dmjhh0dlclDK83QokvbZs/i7f/
         D8kODqfbpftSl0C3OxaPMmjTvNDi0SiFqU0OMw4c7/Gxc6TxnTnfn57c5P6OtmtvSFG7
         DJu5IOqn8HJbn/CL9BTZ7x4H7MdUImTwmbapEgodQ2wqZ0vbEOGkUuxOLE+AZGu/2zCR
         L9UYRXooBMqzPIH+8VXq02281bLf/BWl/8P71x/SWfB8QMfQ5IC1pAQzNW3muHqbmzU3
         NDBPt0SwLSYNkKROB0+IUdy8lZizpp/IsTj1C9dzpgahZkfhoF4bSLFLMNsybmH7v05R
         OpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682923113; x=1685515113;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+38S76C5QyqUQMkBZ45R/3U43wsLQgBrGgiDB5lSCs=;
        b=W29HlXdR9dNkmnv6SU4b52lbC65zWEZ1mXSFqC1+jabWwAcbrmTQCs31WmWfnjRgTF
         BLFqMhTJBZ9usKFNkvWNY/NJwdI3SmL7GtgtCANqs7wGpDMguI3/YAL2yPTrAOVH+R+z
         +UABm62usvaag+tsRjL9LDDaYBtCqTupwfNQrBPrzGQjjFhdn5/SugYDuktu+Dz7WUer
         DjItksDyeViQMQFSqu7llddRlOgFuPDz00BxJ+R3j98kykcRm1RGojULpV4JFpWP/9lW
         0zVOIvGTM5zmt4HaIiFqt9SdM0ibz9aD5+t0GEIN45ETt+A+pLUjysp7Q9ss2EmGm29e
         H7dQ==
X-Gm-Message-State: AC+VfDzNSFwZ4y1G+pJXPOJo/JeWQx0JoPU+hf05yaPBKfi8OV2kLoOa
	ee/YQnDGzn4KjSRXM7FoVapfLw==
X-Google-Smtp-Source: ACHHUZ5Qw+D2zZqMrsGtOLQt3j0Tni9y418xVIbOk+WufglwYOPOZj7R+x+g2+kqjslNEv0q9utc5A==
X-Received: by 2002:a17:907:6e1f:b0:94e:f3d5:e4f8 with SMTP id sd31-20020a1709076e1f00b0094ef3d5e4f8mr17108685ejc.37.1682923113141;
        Sun, 30 Apr 2023 23:38:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:637a:fd0c:58fd:9f00? ([2a02:810d:15c0:828:637a:fd0c:58fd:9f00])
        by smtp.gmail.com with ESMTPSA id d5-20020a17090648c500b008c16025b318sm14481034ejt.155.2023.04.30.23.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Apr 2023 23:38:32 -0700 (PDT)
Message-ID: <68f4ceff-5fa0-fe08-6a3f-c3fe0f8d53ea@linaro.org>
Date: Mon, 1 May 2023 08:38:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v11 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Content-Language: en-US
To: Ryan Chen <ryan_chen@aspeedtech.com>,
 "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Philipp Zabel <p.zabel@pengutronix.de>,
 Wolfram Sang <wsa@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Jean Delvare <jdelvare@suse.de>,
 William Zhang <william.zhang@broadcom.com>, Tyrone Ting
 <kfting@nuvoton.com>, Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "=linux-kernel@vger.kernel.org" <=linux-kernel@vger.kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>
References: <20230430041712.3247998-1-ryan_chen@aspeedtech.com>
 <20230430041712.3247998-2-ryan_chen@aspeedtech.com>
 <93773f00-1301-cf77-9bde-5de0595fec8d@linaro.org>
 <SEZPR06MB5269BD01787FDD95C86031E1F26E9@SEZPR06MB5269.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEZPR06MB5269BD01787FDD95C86031E1F26E9@SEZPR06MB5269.apcprd06.prod.outlook.com>
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

On 01/05/2023 02:20, Ryan Chen wrote:
> Hello Krzysztof,
> 
>> Subject: Re: [PATCH v11 1/2] dt-bindings: i2c: aspeed: support for
>> AST2600-i2cv2
>>
>> On 30/04/2023 06:17, Ryan Chen wrote:
>>> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
>>> and description for ast2600-i2cv2.
>>>
>>> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
>>
>> This is a friendly reminder during the review process.
>>
>> It looks like you received a tag and forgot to add it.
>>
>> If you do not know the process, here is a short explanation:
>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions.
>> However, there's no need to repost patches *only* to add the tags. The
>> upstream maintainer will do that for acks received on the version they apply.
>>
>> https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submittin
>> g-patches.rst#L540
>>
>> If a tag was not added on purpose, please state why and what changed.
>>
> Sorry, My mistake. May I ask a question?
> In this situation, should I submit with new version?
> Or I just add Review-by and send it again?

Please send a new version.

Best regards,
Krzysztof

