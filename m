Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9B86E2FCB
	for <lists+linux-aspeed@lfdr.de>; Sat, 15 Apr 2023 10:52:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pz6Wf4GD7z3cFx
	for <lists+linux-aspeed@lfdr.de>; Sat, 15 Apr 2023 18:52:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lRQjOACQ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lRQjOACQ;
	dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pz6WQ5tL1z3cdZ
	for <linux-aspeed@lists.ozlabs.org>; Sat, 15 Apr 2023 18:52:00 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id xd13so17564242ejb.4
        for <linux-aspeed@lists.ozlabs.org>; Sat, 15 Apr 2023 01:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681548712; x=1684140712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=727pFB0FjNdVpuuxEzPiPIWkdzw9KyCLThLHjRqD2eQ=;
        b=lRQjOACQ945GGlASX3gK/8NJ2LavL17Q9KB6T+XTYMzJz8cUarJhJrrbZLSgJmaAfK
         35KaE66Yda5UmRDeD0GwhnzQJ66L+WszeeFIT8YCAsz0BO3DI7v3dsYINa5cu9tpQB/D
         hYIn/BUyHvm9Zt3gBFR0i9t8hl9RE3WYgMgagzE9GIvYRUSJVTnFN4dIlIZua5HFDwvH
         1twvgqSElT9TltVISyOO5mIZfPvLlJ4C7M+7FPDWvawtfwT6GlxPwGTMtaGIFMuGhict
         KxAnMCCukC9WTv5lIZQyIsi/+dBPAd3QsyyDBdPopNG6XV72gP9dqEHg/j0todk2jV/b
         GryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681548712; x=1684140712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=727pFB0FjNdVpuuxEzPiPIWkdzw9KyCLThLHjRqD2eQ=;
        b=EYVRojFF5mqFzDDSban7iC/GBSWutaDPNbbGkj4A+IKosHmG38CTFqqwcMji2rsZhy
         YIIi4UCL9nWzYo8nBiPWQwiGqgEyt562TNyk95NjG2ZR8deBT0/jAlGNX5+2KCWhEi92
         9OpBH0u1Zge5q5qxfARHVVOOma90KPlP+qTlCv8igkXD/RCDKJBwXuXaI1kUyLK4cSU6
         8st1RMsPeS/ruPgTZNzv0b8KW6+Um7y4EgXYUaodtG5kccPzG6xSE+p50VNxFgMKqR3h
         d5JYsKHg7FzawBQANd128SUOk6zyewzDVYdC0lgfAfbmfbKMKLU+gXMaUvLWt0uigacv
         Q+Zg==
X-Gm-Message-State: AAQBX9fDm4ITDKZCGfvb1JopNz4TliHX6W2whEUYPtU5UUUQ1QU7jHGU
	3RJCSWPt1M7AYqJcHcKu3GJJwA==
X-Google-Smtp-Source: AKy350b+paIPDOmroqwsh6MSvE6G8YXP/c1DRY4EhfNdOp2c8An4cPaK9RA0npi1LeYJFmQWlUBWYQ==
X-Received: by 2002:a17:907:3112:b0:880:a42d:dfb4 with SMTP id wl18-20020a170907311200b00880a42ddfb4mr1330403ejb.16.1681548712153;
        Sat, 15 Apr 2023 01:51:52 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a3bf:4ed:6c53:2a36? ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id i3-20020a1709061e4300b0092b8c1f41ebsm3481507ejj.24.2023.04.15.01.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Apr 2023 01:51:51 -0700 (PDT)
Message-ID: <b848415b-c697-60e9-dca2-97ef612e2a85@linaro.org>
Date: Sat, 15 Apr 2023 10:51:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v10 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
To: Ryan Chen <ryan_chen@aspeedtech.com>, jk@codeconstruct.com.au,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Philipp Zabel <p.zabel@pengutronix.de>,
 Wolfram Sang <wsa@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-i2c@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Jean Delvare <jdelvare@suse.de>, William Zhang <william.zhang@broadcom.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Phil Edworthy <phil.edworthy@renesas.com>, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20230415012848.1777768-1-ryan_chen@aspeedtech.com>
 <20230415012848.1777768-2-ryan_chen@aspeedtech.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230415012848.1777768-2-ryan_chen@aspeedtech.com>
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

On 15/04/2023 03:28, Ryan Chen wrote:
> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
> and description for ast2600-i2cv2.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

