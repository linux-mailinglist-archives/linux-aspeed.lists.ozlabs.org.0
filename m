Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5DD694744
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 14:43:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFlsN5H7bz2xHH
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Feb 2023 00:43:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I977dKPv;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I977dKPv;
	dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFlsF1ggVz2xHH
	for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Feb 2023 00:42:56 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so9052040wmb.5
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 05:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HIAcdxLyEuufdGFUueiPhmcNlqEoybL3rHoEBEogZTQ=;
        b=I977dKPvxx4jeIFkAqfT+daSuzz3oLijiiKDxk/UBuqMptkkuuz7kfFSKK0xutTiZf
         hiOJgF3fl+Y/MX+LaJpSNESksYt0OjEMUjms6zwKDR4numpdDnT99Anry48fRhci8kRM
         OAIfCL/A/zr4N1cuFynHmHxA8Ucx4xlLLUUx2ly8YENbsByh0/73w66IuKrOuvHSUwTC
         WzYwyNHv3VdQFnBGGq/KQQKooq0j5ySPyxOIcnLJsSDccU8Nkjc4e69VNtRA/fl7uQuo
         oV0G403oyLX2Z19lC2Wv8etO/RM2h8tz6srB3yhGv+nw+XC83bJHvATCKnJxMH9rKzal
         Nxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HIAcdxLyEuufdGFUueiPhmcNlqEoybL3rHoEBEogZTQ=;
        b=xMuQg6evzY8M5RvzZmLhPOgXQ2bfz0cs7Wu802U+FDsQMY/1ovn0wIZM8rgajyUsih
         gBvG4jdqyqRESW2Br6naXuVKCuhR1yaXMt7gxKY0HCXHuM3JL0st12g3U2CFDWUI0yEs
         uODZuAFR6w0waCd3AmdLhPz9Bw/EVYrGh9eujjsLGGjCH6U7MwAU8FaBs/7GXTmwrPIT
         KjeQjpbRB4CFxuOEAeZhP26Jleev7FRkj3/w9MbeEXbKlsp4yuBAwcUb0TZrkwfnjrEn
         Cu+L+/0l3lq+MYDXTITle7wsgaDDl+/c9zdRuAK+PSCINdFmLWTkAer8Xn24ooJQ7avr
         HypA==
X-Gm-Message-State: AO0yUKWTRzuf38wfpXQ80ElDSXHhs8ZXgcDRfVomVVtNyBfokrBkROX3
	2od0CMNQVfHZdBjp3HQ8c/cO1A==
X-Google-Smtp-Source: AK7set8NsXVdIhjMfNfcPihlMRblNz/HZ0919kMflG7DSie+KRZqHSFj/3VWOoPlwk5gzuuTaFWjXQ==
X-Received: by 2002:a05:600c:43c4:b0:3dd:1b76:347f with SMTP id f4-20020a05600c43c400b003dd1b76347fmr18942938wmn.18.1676295773464;
        Mon, 13 Feb 2023 05:42:53 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id be7-20020a05600c1e8700b003dff2b493c8sm18532819wmb.36.2023.02.13.05.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 05:42:53 -0800 (PST)
Message-ID: <6066657a-8e6d-77d2-7074-7ab1ad402b89@linaro.org>
Date: Mon, 13 Feb 2023 14:42:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 2/5] dt-bindings: clock: ast2600: Add top-level I3C
 clock
Content-Language: en-US
To: Jeremy Kerr <jk@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org,
 linux-clk@vger.kernel.org
References: <cover.1676294433.git.jk@codeconstruct.com.au>
 <cfa142894e3e3a2895ae1ef7dce9bc89c493b9f4.1676294433.git.jk@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cfa142894e3e3a2895ae1ef7dce9bc89c493b9f4.1676294433.git.jk@codeconstruct.com.au>
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
> The ast2600 hardware has a top-level clock for all i3c controller
> peripherals (then gated to each individual controller), so add a
> top-level i3c clock line to control this.
> 
> This is a partial cherry-pick and rework of ed44b8cdfdb and 1a35eb926d7
> from Aspeed's own tree, originally by Dylan Hung
> <dylan_hung@aspeedtech.com>.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

