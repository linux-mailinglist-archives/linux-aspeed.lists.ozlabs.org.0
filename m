Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F5F687817
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 10:00:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6t6w3qCyz3f2q
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 20:00:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ke2QSu79;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ke2QSu79;
	dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6t6q1rm9z3cdZ
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Feb 2023 20:00:51 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso777321wmq.5
        for <linux-aspeed@lists.ozlabs.org>; Thu, 02 Feb 2023 01:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TKq4treMgsTZRQILo8co/I9Ikhm/khYV4Rk1K1haA+o=;
        b=ke2QSu79xcXZE3aviAuMKJB0RiGvC0HU1IkEzQCn9BWGIDp+8J87I596Wpl3vtefCY
         T3LMFALxH2p68zIH22LzxnzCpsO7dI1RtjabOWdl7heuMF6yj2cD5xJyH5FnQUV3oKo8
         XZYkO+7XyoFtwYgpCcx+WhkzemkNm5DkPP2MnkR457eQBgEYHf7v/XCJAN0RLVbfv3f4
         kRVrO3l3JO/Z51P8/5Pw8ACYazE67NTJnc62fE3Qm6m3d7UWZvJGI6QFNWx85JAPAEWd
         JSDT0yO+fxE7EDn3CQC4Ls0PAlVhM+le0+rXlAqV3/JSa+WsGLOytkI9c/OV9t0sL1vS
         /fZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TKq4treMgsTZRQILo8co/I9Ikhm/khYV4Rk1K1haA+o=;
        b=5d6KCyCRDU4S5dVYebf/e0+Nn/P0c9WShj1VNo1le+wXFi2fImn4q8wm+SFdTeIyMD
         S/jZEfqDSK7s4Dev5SgmRHsTtwly9WKN9FZpfCiSK6NaQSE0PoPNuvYukRvG3k8NqBAR
         o5atKK2OvpPLwrtNp+EqR3MbcOpEQAPzYLDxHJACbA3fluzbWaa3oL/V74qaAtBZfAAN
         HbipRJvrJ6tK1chXBihS8oX52/UTAoMdVt6p5GO2kexu2N4y1MjsanYc3kR9B5566HTv
         qA6m++MQnimZvHTohxWljNGBCSVSw6jLxn8rAWJm2CoUJpVPgd3QChZI5nwUK8w13cZj
         93DA==
X-Gm-Message-State: AO0yUKU0q9TKc1N6IrjzIiP8oIazqzqic6QzgAh8A4fN7rJLrQhFMf9p
	alqYVvPkMCMpT2Y+amvlxEZKgw==
X-Google-Smtp-Source: AK7set+tyNTV3l7sW0JxoBoTjOb8RNLhrkTDJKOM6kz+QcCPq6BNZ4oMn9RCe2ZwvLOjHwOTVQ7lcA==
X-Received: by 2002:a05:600c:3d8a:b0:3dd:af7a:53ed with SMTP id bi10-20020a05600c3d8a00b003ddaf7a53edmr5251781wmb.11.1675328447118;
        Thu, 02 Feb 2023 01:00:47 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r12-20020a05600c424c00b003db0bb81b6asm4000970wmm.1.2023.02.02.01.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 01:00:46 -0800 (PST)
Message-ID: <ac9be40d-bbcb-02b1-2708-61f88095111b@linaro.org>
Date: Thu, 2 Feb 2023 10:00:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 0/3] Add ASPEED AST2600 I2C new controller driver
Content-Language: en-US
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Philipp Zabel <p.zabel@pengutronix.de>, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
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

On 01/02/2023 11:33, Ryan Chen wrote:
> This series add AST2600 i2c new register set driver. The i2c new
> register set have new clock divider option for more flexiable generation.
> And also have separate i2c master and slave register set for control.
> 
> v4:
> -fix i2c-ast2600.c driver buffer mode use single buffer conflit in
>  master slave mode both enable.
> -fix kmemleak issue when use dma mode.
> -fix typo aspeed,i2c-ast2600.yaml compatible is "aspeed,ast2600-i2c"
> -fix typo aspeed,i2c-ast2600.ymal to aspeed,i2c-ast2600.yaml
> 

How this can be a v4? Where are all others?

https://lore.kernel.org/all/?q=dfn%3Aaspeed%2Ci2c-ast2600-global.yaml
https://lore.kernel.org/all/?q=dfn%3Aaspeed%2Ci2c-ast2600.yaml

I see it for the first time.

Best regards,
Krzysztof

