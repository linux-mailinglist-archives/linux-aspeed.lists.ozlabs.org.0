Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A026693FDC
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 09:44:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFdF44XjXz3bVD
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 19:44:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YjkXFCRg;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YjkXFCRg;
	dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFdDy4NjTz2x9L
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 19:44:34 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id co8so7531347wrb.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 00:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2YIdYTMgNx2IaCEVJN4jlOnxMUO1xnqAx+6A+uNEAcc=;
        b=YjkXFCRg5TcrOcgL2Fs38nat5ry747T37B6iJUrC6jMA1Z+o0w6Nilc0BCchSy4rN2
         OF3RVtd55sYCgNDu9/l75A+Fj7VAZIwaCBhNWg2dfQm6qzPypxx9OLmcB+dT1SzcZBVA
         XlaFfpmelcHXtUV4OAZXJQvkdHWdsKy33ocb1SW1b4dvXZFxrzfSBdNLH4DqjV9uw7cq
         rY98ChhHgQNg7i8EcT+4Ibe+9F9ro2YqaruhAzSKWov11JxiroCTZn/Q75k4J6DtNzJP
         W17HkjQkVAi/J+Jit4UeI4blF5i2x9EZiZPsjlRJc8ATWjk8hVKV5s4DO+fMUYkII+i0
         2v0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2YIdYTMgNx2IaCEVJN4jlOnxMUO1xnqAx+6A+uNEAcc=;
        b=dmjz9Q9ZSk3CE4ZxdVvF9dLECDd6xFZbCMK2UAGof40isWJGsjXA4LB8K1zYiSFddc
         vj7zS0ghs5Vp6FuLVPrrFQYqylkugtYEzwj/kjcwKWmBWoleeMKGps5lj1ygDWvLFIgs
         tT9pwDBg4Zz1p691/jv7whWf//NRds6ST1nXQJ8uusIQehEs0FqVXJwmK8YD4RvqLuyV
         PQcsuflcmKfHlWW7klgLa19NHkSFu31Q/PMeQ5/qz0x4HbradLfoA5oFfpY/Ww71BDb0
         vfMQ5gMniJNyBZXezSeMatxRzk95xUUbKDyGSaJOghnxsbGTd9XV2URKFeOnnARkz781
         jhhQ==
X-Gm-Message-State: AO0yUKXudGqnm7jZ+mWgmWBko0LhTQkbfrwRGzo5rKKwYY+JHjtqYtMV
	DQUh9XWqgKcleasJUoJOjjMVmA==
X-Google-Smtp-Source: AK7set8yVwUTFGFiHkPZPEALwlo9zuu100bG//XEmpcVm+58X/ACQl/dWsW+UshyzwW2OQ5yTF00fA==
X-Received: by 2002:a05:6000:1003:b0:2c4:745:13b8 with SMTP id a3-20020a056000100300b002c4074513b8mr12526791wrx.42.1676277870529;
        Mon, 13 Feb 2023 00:44:30 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o7-20020a056000010700b002c559def236sm1353565wrx.57.2023.02.13.00.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 00:44:30 -0800 (PST)
Message-ID: <4eed8885-a149-43b1-f6f6-f9b7fbb2f3b4@linaro.org>
Date: Mon, 13 Feb 2023 09:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/3] dts: ast2600: Add reset config for I3C
Content-Language: en-US
To: Jeremy Kerr <jk@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org,
 linux-clk@vger.kernel.org
References: <cover.1676267865.git.jk@codeconstruct.com.au>
 <f426c3a22d64d076b007a0fc75dc95a389a9387f.1676267865.git.jk@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f426c3a22d64d076b007a0fc75dc95a389a9387f.1676267865.git.jk@codeconstruct.com.au>
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

On 13/02/2023 07:02, Jeremy Kerr wrote:
> This change adds the reset line definitions for the AST2600 I3C block's
> reset inputs.

1. Do not use "This commit/patch".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

2. This is not DTS. There is nothing from DTS here.
Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).


Best regards,
Krzysztof

