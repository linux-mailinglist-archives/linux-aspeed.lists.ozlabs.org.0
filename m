Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F6C698E4A
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 09:09:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHSJh3SJ4z3chr
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 19:09:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WX0oYy9l;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WX0oYy9l;
	dkim-atps=neutral
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHSJY0dP0z3bgq
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 19:08:59 +1100 (AEDT)
Received: by mail-ed1-x536.google.com with SMTP id cq19so1645859edb.5
        for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 00:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FFWHYzQ47F08kHCRk+CWBqg2wpk6kOfepSZvlMuKJME=;
        b=WX0oYy9lfCJIEjq74PrXD62FgtWfmHosGgxgT0UvwifnLXr3CW1TkRnoxk/o5qk3wR
         jU/NNzBineBSw4YQ6E2XenNOHtdolgpARYITqqgwalb1OA6ujxwRmpiYnS3+XYFSuJJ2
         OXY55ZyRLd41mTUQwpUS4PE6I5+MugD6zD+jALbWdneUmVB4Rj/MbA+jciXJx42HMzvP
         xFtknXmuqnwLHp/Wbr1RHpyMpt3HO3kJZnZS21oBkhujmpcBsfmViwscIF654Z2ebVYS
         1VESqkMorWS7ui9XysezRNwTgrjH6c+Jk7m8lgBsn9K/I+PwgPEUAm2bHMV9K3Fc0Iqn
         obAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FFWHYzQ47F08kHCRk+CWBqg2wpk6kOfepSZvlMuKJME=;
        b=305D2i7zeDLVC2i5rNpob43K8GVsrQ8pP2EgU67sBB5ysaBo6q/EOxjfDoOWqYPEce
         P6fDwpujHl+9POWsuFaEm0K4eGwanemkhk1ZWIOvYGIt4YZHjtkMbw/rmTdrsWSBiYGA
         Cv4cXcO90JHEig2srN9xNe93j0Q+NoviimP5625+QtmsY4xkwlKbgcp/kc8T0AW5oTcq
         /oR0c82YSZCxCezkl1yF/WKex8KAYsOyBsx4XOzFNpMPQGgVLCFgEqhaVdkE3ag9bxvM
         ro0uh9ihVnTBroj3lSymlsWuT4IJnU8z/0Yzp8nJwq6dFiJmTaNwv5HWs2/WGYNCT62+
         Pe3w==
X-Gm-Message-State: AO0yUKU3cRO8QkJ4O59fjmA1dj4cjKREiNrrE+uqvzkCIviENXf1GlXS
	px81YgQacAK4f5sWIDhAexx96Q==
X-Google-Smtp-Source: AK7set8I2bHOqG2L4ep05Jnc+APlOvu9ihdXtivHE3MB/bdMnlmw01tngILrwwV+YpsHBAbsDyW1PQ==
X-Received: by 2002:a05:6402:1f04:b0:4ad:66e8:ca9a with SMTP id b4-20020a0564021f0400b004ad66e8ca9amr109314edb.6.1676534933708;
        Thu, 16 Feb 2023 00:08:53 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id x22-20020a1709064a9600b007bff9fb211fsm470600eju.57.2023.02.16.00.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 00:08:53 -0800 (PST)
Message-ID: <198c084e-66ff-1f3d-33cb-a1339b34336c@linaro.org>
Date: Thu, 16 Feb 2023 09:08:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 2/3] dt-bindings: i2c-ast2600: Add support for AST2600
 i2C driver
Content-Language: en-US
To: Dhananjay Phadke <dphadke@linux.microsoft.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
 <20230201103359.1742140-3-ryan_chen@aspeedtech.com>
 <b0f55494-3a17-4d87-7b8f-5b078503cb53@linaro.org>
 <SEZPR06MB52690A1D06F3CFEAAF1FDBDEF2A39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <a62fb259-3ad3-b75e-c59e-2ce937bf799a@linux.microsoft.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a62fb259-3ad3-b75e-c59e-2ce937bf799a@linux.microsoft.com>
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

On 16/02/2023 05:17, Dhananjay Phadke wrote:
> Hi Ryan,
> 
> On 2/14/2023 9:43 PM, Ryan Chen wrote:
>> It is not duplicated, as my description in cover " This series add AST2600 i2c new register set driver"
>> So, this will be different driver compatible.
>> The original compatible is
>>        - aspeed,ast2400-i2c-bus
>>        - aspeed,ast2500-i2c-bus
>>        - aspeed,ast2600-i2c-bus
>> So the new register set compatible is "- aspeed,ast2600-i2c", remove "bus".
> 
> Is it possible to keep existing driver drivers/i2c/busses/i2c-aspeed.c
> for ast2400/ast2500, while move ast2600 support to new driver
> altogether, say i2c-ast2600.c along with new register mode? By default
> new driver can support legacy mode with same compatible "aspeed,ast2600-
> i2c-bus", additionally driven by dt props, switch to new mode.

So this is for the same hardware? Then the bindings are duplicated.
Driver is actually duplicated as well - rework the old one, instead of
adding this.

Best regards,
Krzysztof

