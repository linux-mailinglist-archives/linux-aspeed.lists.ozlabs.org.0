Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC01693FA8
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 09:31:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFcy741blz3c6Z
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 19:31:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=U5aZIVwz;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=U5aZIVwz;
	dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFcy16HrTz30Mn
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 19:31:36 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id o18so11266577wrj.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 00:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gz6xm7NoqnSOUARx/CNCDCfdeCI4cT5lZ/yhcZmlHMg=;
        b=U5aZIVwzZo8Q4S4+FGo8CVxrW/Nc6LBfif9lyHMNpX0bZmxYinkZwCqhJppeddapMX
         O+OzsuACDo7fqmYAu+ujfyuYvzxTpzWiwpRDYsH2dnwbfHQhFgQgQDYksm12D/iA7q7B
         LPwHBUVFJrWs0lUyDoAxVHMSkHPpL1XdJby8J9jBqwDs6osv6Qm+Htdv1UvMpe6IaoT7
         dHMxT2NpCisvKDRhpjjvb0Po3rTrDFAgsAUH2fkvRKTzk2SmPyX3nvGnjxKEi1oIxMPS
         Ll8B6MRsqpFqz3I4gkpc5SYDyebDBA1Xy4LzHoW/4M/zKKAUlMV2p6mxdxsQdp/ljV/D
         k28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gz6xm7NoqnSOUARx/CNCDCfdeCI4cT5lZ/yhcZmlHMg=;
        b=bKEHZlP2WkVaSNQYvccD/LiZXMMU+6m57XsZ47NQ8jF72l4n4c/AX/MUzKJR+XkO/A
         o382oChnHzAWxE9UsTfMQV9BjBNmqOJ3FM+RlySbk/WPHyqufAROJXu0ScvpExb+heM3
         ZQhkf/GbugFEjqRLNau5ECQpwgk5Rgg+itgkX9EBJcYfIYywv5xP6cG3oFxp0jh0umun
         IaCsqbvdk58qyhXim/n3bGbVIlhMu6f56QQLS/V67cRcT2cjJttQsVJ0mUbfdWsC7TbL
         6jJaHyJuyCgB/d09h+P2Krefx97Qo143u/cyFSBdIDGNghkfLYIHxkFdTnFM8vDpUifI
         2Llw==
X-Gm-Message-State: AO0yUKXFY/y9msMPJKwdYVVWJLTq1SPOVYKp/e5hddjd0ItUjJxNkRva
	XfoFwnuKO0KKmhhOa+RurI7F1X0yfVH0sEUd
X-Google-Smtp-Source: AK7set+N7x2GSsWP/iFk+wfnyxzr8inqcA6iJA/Kh83OJ6pl7nPyZAAMwrqzG83xPneO0KZeX6Egbw==
X-Received: by 2002:adf:ec83:0:b0:2c5:56f6:52ce with SMTP id z3-20020adfec83000000b002c556f652cemr3195215wrn.26.1676277092816;
        Mon, 13 Feb 2023 00:31:32 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h8-20020a5d5048000000b002c54d97b1ecsm5767203wrt.72.2023.02.13.00.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 00:31:32 -0800 (PST)
Message-ID: <ad200b06-368a-1f01-41e1-6b639d128186@linaro.org>
Date: Mon, 13 Feb 2023 09:31:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/4] soc: aspeed: Add UART DMA support
Content-Language: en-US
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "jirislaby@kernel.org" <jirislaby@kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <20230210072643.2772-1-chiawei_wang@aspeedtech.com>
 <20230210072643.2772-3-chiawei_wang@aspeedtech.com>
 <c1e096fa-5941-cdd8-2cdc-ecf04661a389@linaro.org>
 <KL1PR0601MB37818F70A166356FED0FEC9C91DD9@KL1PR0601MB3781.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <KL1PR0601MB37818F70A166356FED0FEC9C91DD9@KL1PR0601MB3781.apcprd06.prod.outlook.com>
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

On 13/02/2023 02:50, ChiaWei Wang wrote:
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Friday, February 10, 2023 5:14 PM
>>
>> On 10/02/2023 08:26, Chia-Wei Wang wrote:
>>> This driver provides DMA support for AST26xx UART and VUART devices.
>>> It is useful to offload CPU overhead while using UART/VUART for binary
>>> file transfer.
>>>
>>> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
>>> ---
>>>  drivers/soc/aspeed/Kconfig             |   9 +
>>>  drivers/soc/aspeed/Makefile            |   1 +
>>>  drivers/soc/aspeed/aspeed-udma.c       | 447
>> +++++++++++++++++++++++++
>>>  include/linux/soc/aspeed/aspeed-udma.h |  34 ++
>>
>> NAK.
>>
>> DMA drivers do not go to soc, but to dma subsystem.
> 
> The UDMA is dedicated only to UART use and is not fully fit to the DMAEngine subsystem.
> For example, the suspend/resume operations of common DMA engine are not supported.
> After observing certain existing DMA implementation in other soc folders, we put UDMA in the soc/aspeed as well.
> If it is not appropriate, should we integrate UDMA into the UART driver or try to make UDMA DMAEngine based?


You did not Cc dma folks, so how would I know... Maybe soc is right
place if the DMA driver is not suitable for other consumers than UART.
Maybe not.

Best regards,
Krzysztof

