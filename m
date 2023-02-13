Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAD169474D
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 14:44:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFltt4ZLgz3c8F
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Feb 2023 00:44:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ytH2NJkc;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ytH2NJkc;
	dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFltk5TLRz2xHH
	for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Feb 2023 00:44:13 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id m14so12249920wrg.13
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 05:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8YndzVf3v6/PsLB4xK8l0Uo2uF+AS5qRQ1VgyuaYEtU=;
        b=ytH2NJkcPta5r4EPLRm4775bH0r5ADtnJOIFsbPl09/9KNCMgIaz0PZV0BfJeqrnlU
         quS+NGLbT99F2JIBYG6vbpD5/cKVtpifXUqqS6600N+5wH2H9WhF/teI/24Zaf+X8QEN
         1+d7xqvzZ2KsizaauuzRc6Vo7o4hmEjWJcvVM7uvFnTF9lc9mz/nmdDKPJDiKPXpDSZu
         JTVTTi4EJWM1HaPisNF4f4NwI+nv4CUWrfPs3S0TUqz8qUCRcmAoaJgba3NdZyv77XEu
         ede5e4NixFfzGxYTtC6a63WsB2CZDBQhBdoDz3zzOr/XTMYKKSHT4raPwz6A6MLgQAF2
         k0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8YndzVf3v6/PsLB4xK8l0Uo2uF+AS5qRQ1VgyuaYEtU=;
        b=j4x08O0+vREieF+xU7vx1m+P20VaP6GTGRnrtMMxQf4/TwAZ91zpmegwDcjtwmEnel
         HLtM8HzbPPikGamI6Bz3K3YcXxqW/uN6t6aFIzAJaKpEd2DfoaWxMI9n4pccGp3rbRUv
         U3LD+NgqS8GvYwX4MFKsj8Qi1A6626c5yLfCR7LXu8/ULWwlSR6Lk3eSITuA5w52qN9K
         ++tRyAQ+uUSqDX13xnkOvhUJDHDxWMobDwq7337Rphla/iBYW+l7rVSifFC+wPQRp6gf
         4GOJE+3/Yyh4/odtHmifTH7aZYih4/oYEWH4hgWgvCtMxxLIfKGkx6CZVOOKQpoTon/Q
         OlbA==
X-Gm-Message-State: AO0yUKWKsACwIGKKGYWO+4rUoe630GGNUbOf7YzRDLPLgkupMN/HRJRE
	6c4TJEZXqAlQB8/XV+Zu9Mx7pTM56ajq+A/n
X-Google-Smtp-Source: AK7set/17SJjnCRcpQIPGHx+EFyoU4FpCGw43e1kOiXX79UznQPjL3PPfrqHr+skXbFC8GK1Qch8Mg==
X-Received: by 2002:a05:6000:1808:b0:2c5:5929:4bcf with SMTP id m8-20020a056000180800b002c559294bcfmr2854910wrh.28.1676295850679;
        Mon, 13 Feb 2023 05:44:10 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v17-20020a5d43d1000000b002c54bf0e9f7sm7801758wrr.117.2023.02.13.05.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 05:44:10 -0800 (PST)
Message-ID: <eb0fa8ee-9c14-c8a4-2d3e-6180f5d875b6@linaro.org>
Date: Mon, 13 Feb 2023 14:44:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 5/5] dt-bindings: clock: ast2600: Add reset config for
 I3C
Content-Language: en-US
To: Jeremy Kerr <jk@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org,
 linux-clk@vger.kernel.org
References: <cover.1676294433.git.jk@codeconstruct.com.au>
 <3aad8dc671a65e65f0cced648847c504514f5b0e.1676294433.git.jk@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3aad8dc671a65e65f0cced648847c504514f5b0e.1676294433.git.jk@codeconstruct.com.au>
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

On 13/02/2023 14:24, Jeremy Kerr wrote:
> Add reset line definitions for the AST2600 I3C block's reset inputs.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

