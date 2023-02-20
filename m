Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DD669C6AE
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Feb 2023 09:30:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKwbg48DGz2xl6
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Feb 2023 19:30:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IGB4kXcY;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IGB4kXcY;
	dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKwbW1f0Bz2xl6
	for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Feb 2023 19:30:30 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id h32so1614976eda.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Feb 2023 00:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Js7L+CkgcBF/y/Uhhz2Sc316S081v8fL7RAo0kHVqwk=;
        b=IGB4kXcYu67P245U4esqcKoLzMy8Kjkvo8zfwueszOkGC3HxvBxpRftuFL6CR+yVQL
         ejXHuDRCpdSZ75of2N6xqwXKIHoTyBILDODkcC3wPyNr4jTSWPSYhksUjim9EWz3fvJZ
         i5M7kaO2WFG0NvrM9AriGfWqLuhbqtq61LGCGmDz9dQXh8LdXOyT741FM2wiTifIxTvm
         BrW5hKvkRRjx0DQcFHAZZOAJyaei5EG6MfUUW5L74UWcDjxyZJnyW6dJzcSR6qf1uSlB
         6WpTPlMbaO2J+Lq36Nmn8mCz1KmorioT4Thf0lOdQ1juqCRwDYA48BwjKqL+qjxxacXQ
         mFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Js7L+CkgcBF/y/Uhhz2Sc316S081v8fL7RAo0kHVqwk=;
        b=pjEkFHp7XoX4q1PucXMIPihbMuHao4t4u5KdNSUoL7OwKCw/R6nxKF6qtVCfKb+hmQ
         fVhglBWrhwx14sXcto3Qg0pSS/ywdHKyCvNqmWoI2+MB8KjtnYB84VyiGFouwuzK53zB
         FExEsv3yJSGx7uz/M9kj4FSQP5i7YbBIhe5jGDg76pr+qFgfJFDNOD9pI39dGIggwpIC
         U7E4GF+PHq30biUqExfbpOkqc0Y3sglMBIWRyPzHBzUdEA7OZncpr2TDyT2obvxpQRg1
         p2sdcj/nTVPjeMLDv+SlBwcW68xaVYi5Sqns3j/sU4D82ZO1Fr7jGJenLNu5da6ik7cM
         x3Mg==
X-Gm-Message-State: AO0yUKXkYoS1sCpO4ERi9nL7PC4yr3w2ETc82Ih6tlF+lqcqtY2MYd6s
	s9SZc8ZRvg/sPn+pDSrpkhMzlw==
X-Google-Smtp-Source: AK7set+kA39fOKMbx4fa7bjTggtkXN1nyAZdsFsGIrOygGYCF8H99jPC9Z9nxFi5UUMXqsaVR8tAKg==
X-Received: by 2002:a17:907:6e8f:b0:878:4d11:f868 with SMTP id sh15-20020a1709076e8f00b008784d11f868mr13303080ejc.2.1676881826565;
        Mon, 20 Feb 2023 00:30:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id mj8-20020a170906af8800b008b12c368ba0sm5443723ejb.45.2023.02.20.00.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 00:30:26 -0800 (PST)
Message-ID: <54ef0dee-30dc-3ba9-d2f7-8270204b5505@linaro.org>
Date: Mon, 20 Feb 2023 09:30:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 0/2] Add ASPEED AST2600 I2Cv2 controller driver
Content-Language: en-US
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Philipp Zabel <p.zabel@pengutronix.de>, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
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


On 20/02/2023 07:17, Ryan Chen wrote:
> This series add AST2600 i2cv2 new register set driver. The i2cv2 new
> register set have new clock divider option for more flexiable generation.

Typo: flexible

> And also have separate i2c master and slave register set for control.

Since several of my questions remained unanswered and quite frankly it's
fruitless... so let me read the commit msg directly - it's the same
device, just with different register layout. Having new compatible makes
sense, but this should be part of old binding.

Best regards,
Krzysztof

