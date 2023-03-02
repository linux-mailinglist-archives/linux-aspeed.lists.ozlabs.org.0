Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8006A7BED
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Mar 2023 08:36:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PS2wJ1jknz3cMj
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Mar 2023 18:36:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bf8Rpe2m;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bf8Rpe2m;
	dkim-atps=neutral
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PS2w65zL3z3bgT
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Mar 2023 18:36:04 +1100 (AEDT)
Received: by mail-ed1-x532.google.com with SMTP id d30so63977018eda.4
        for <linux-aspeed@lists.ozlabs.org>; Wed, 01 Mar 2023 23:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677742560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XCQZG2b6SjjHN0wfxKrnSflpvL+Z18WTHOqyR2lQDUY=;
        b=bf8Rpe2m42aadVErpqsTPzwa4dIeFJb9LbEzJeoa53Bh57v1DaLkkxi1HD3oK5Agcb
         5f9u5Blm5jX+432IXEmEXRNpjJkz5vatmQ09pwQRVbRTlSol9CBJpGbfWeJVeYs1SfJd
         783vrdnTd6Xz5bZgJ0N22viVDA3WWEppROrHfOwNFeaicKIo6Eqj0RhC97Hag8AYZSm0
         X1eKarC7GKdU/1NgCsK4OJpKeC+jsL6Jc1gSE9KR4bzWSo6AIk/9pwOMwi07j5zShVqH
         bKistQWZAXbyO43dyOj9edQV3uFaGdFRbF79NVChHt1RY5Tx7l//fdWZ9EF61DvNlmmE
         PpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677742560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCQZG2b6SjjHN0wfxKrnSflpvL+Z18WTHOqyR2lQDUY=;
        b=5RizuGEv3WEz/4ZM1pXRAYcFIjnnyTfUqFhqGFRA4JhGxJHmM+SaZ8UWs5pI8WVKJV
         sX2Q+7AyH5vYK2mkP/TSRMY/4Zgt0ip/rbhgdbU1tNjHH7FtRTW6IDnW303BJaHG3M6X
         0p651ysYuHuZ066+/8VOz8M4hwkekes0lYD5Gl01G2zsYa8NMmpZOB9WKBoQMQX23/Vo
         ZkWW0IwhITkwtVnTYLNDY8F8hlqMSHoMqpUd7ZcuHXGJHY0u9Y/O1CfpBPyhtsF9V/Tu
         1pu2v81/fYnGMK0cRTRIyFUy5Jn7Af/niJSvjS7kas0aBip1/Gw//bSwNdXSuxPWEX4s
         oerA==
X-Gm-Message-State: AO0yUKWIfnSQcvqLLalhy8Hhk5NajGdUHJp3kpwsgsvDChllNY4YerHr
	HYYVHimbqRevexuT9B7ZoKn16Q==
X-Google-Smtp-Source: AK7set8Stq6eJ2jfWoMqx3IDPesp90JlK5i/M5llisyWgsD8i8UNUT0SDrUjZ9NmAVATNrX9YcgbQw==
X-Received: by 2002:a17:907:a0d5:b0:886:221b:44e5 with SMTP id hw21-20020a170907a0d500b00886221b44e5mr12137595ejc.62.1677742560629;
        Wed, 01 Mar 2023 23:36:00 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q8-20020a50aa88000000b004bc422b58a2sm1635332edc.88.2023.03.01.23.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 23:36:00 -0800 (PST)
Message-ID: <2c16fa96-a710-4ea6-74df-247a4bc7d2dd@linaro.org>
Date: Thu, 2 Mar 2023 08:35:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 6/6] dt-bindings: clock: ast2600: Expand comment on
 reset definitions
To: Jeremy Kerr <jk@codeconstruct.com.au>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
References: <20230302005834.13171-1-jk@codeconstruct.com.au>
 <20230302005834.13171-7-jk@codeconstruct.com.au>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230302005834.13171-7-jk@codeconstruct.com.au>
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
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 02/03/2023 01:58, Jeremy Kerr wrote:
> The current "not part of a gate" is a little ambiguous. Expand this a
> little to clarify the reference to the paired clock + reset control.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

