Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFE369405A
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 10:07:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFdkz1p2Lz3c6C
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 20:07:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fX9PXVrA;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fX9PXVrA;
	dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFdkq2q5qz309V
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 20:06:59 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id o18so11368535wrj.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 01:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eLWu10DQx+qn08ahKIWeZviWaNMMEUUkvNpohUv3kkA=;
        b=fX9PXVrAm5lqsZ7DDeuDuYuB065HN7eGeSdRbshfKC7d/HHm/s483w1tiG9a48rQ4Z
         ODaUNB47FYUWxpXWfMQSk3P+/Mtc4aK0dH0EBdIsIW12iLpXA9QW4xix0ADMg2BhD/kZ
         pBhahbHWD1OwrFnZGDUccaweZpcUNtgF40iNJG5C4evgy0gXm6o6TfbRO9uwlToLuTzq
         7K7iZ0TBYHiIxIGWV4tURG2KrR/wkQPm1bPKIy6NHeFIc8G6ORNys9Wcbye/GXhyA7Zy
         vZrgJWwKIwEEhdm0c2qKUfRuQV2lDOpMpnFEAKyno7rkXuu4Z4RsFa5XagVbB1Ez9lOa
         +rRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eLWu10DQx+qn08ahKIWeZviWaNMMEUUkvNpohUv3kkA=;
        b=YjVQlXpVxwqUBmZL6GThvnhn9zqtOPlgTgdyGIE5dogV2H4Pi2o9s9evEk5fV7JjLb
         sMLyBjMQq+/HbKOaeST8rKfhD3kAkjEcqSXAbAv/Dk9aGbPvUnWsNnmFd1J1tpNp/BPB
         O8MYUeKxcqromdasTw/c5WPzxzF32e5Dug4sX3xzm8v+ywp+g2fs36c2rTebLOupBeGK
         EaVw6YnhjJDA847NQJmPi/5ZnC8PFBANpVOKytlmZdbghjaMkx7QysWYT3hZM+Tp0iu8
         gglwiWH5zis+yH4/5uo9Ht6jBfC13dknSvzwVI8wQj1DAbCOZKxyNJVVVXqi0aWn8d3A
         kTKQ==
X-Gm-Message-State: AO0yUKWOP5WtgUCbxr/knmvejH84IiHSQj/o03zrjselVYnqNJ7Cuc2U
	jEzZn1yyzLCWDZ84Gn0yH1zXlA==
X-Google-Smtp-Source: AK7set9nP2WVVnV8sFiOPZH8sacqNGYYKvDF4e5RyL2+QyiRPUw6Dj+hv0u6ye4Q/mBptzv7B1Cf1g==
X-Received: by 2002:a5d:6707:0:b0:2c3:d69a:1da7 with SMTP id o7-20020a5d6707000000b002c3d69a1da7mr18863722wru.0.1676279215317;
        Mon, 13 Feb 2023 01:06:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o5-20020a1c7505000000b003dc48a2f997sm16207034wmc.17.2023.02.13.01.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:06:54 -0800 (PST)
Message-ID: <2a3f5c20-3bfb-c1b8-f9df-d1908022509d@linaro.org>
Date: Mon, 13 Feb 2023 10:06:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/3] dts: ast2600: Add reset config for I3C
Content-Language: en-US
To: Jeremy Kerr <jk@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org,
 linux-clk@vger.kernel.org
References: <cover.1676267865.git.jk@codeconstruct.com.au>
 <f426c3a22d64d076b007a0fc75dc95a389a9387f.1676267865.git.jk@codeconstruct.com.au>
 <4eed8885-a149-43b1-f6f6-f9b7fbb2f3b4@linaro.org>
 <40269fdbc75a149a37e8a44f62cb3a6102f61d8a.camel@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <40269fdbc75a149a37e8a44f62cb3a6102f61d8a.camel@codeconstruct.com.au>
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 13/02/2023 10:02, Jeremy Kerr wrote:
> Hi Krzysztof,
> 
>> 2. This is not DTS. There is nothing from DTS here.
> 
> [and from, your reply on patch 2/3:]
> 
>> Why do you use subject prefix in patch 1 different than in patch 2?
> 
> Ack, will change to "clk:"; there is quite a mix of "dt-bindings:" and
> "clk:" on the changes within this dir. I'll unify across the series.
> 

There was clk already, wasn't it? What do you want to change? I asked
why do you call it in the same patchset aspeed and as2600?

Best regards,
Krzysztof

