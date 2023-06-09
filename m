Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BF672994D
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Jun 2023 14:13:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qd0Nb0VVmz3f86
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Jun 2023 22:13:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ypCdboJH;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ypCdboJH;
	dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qd0NR3WLsz3dvx
	for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Jun 2023 22:13:26 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9741caaf9d4so259747866b.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 09 Jun 2023 05:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686312802; x=1688904802;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/d+dHBgEekjDSHClTJsQ6wFO80YgJRYqTq5jLwHrLwA=;
        b=ypCdboJHyF8Pl/ysbJkoYgLbs2KgBOkv6jkgGU15xvwv23HstfZfrsJpg3tC1MEEuz
         vXmsyfIHbJSOHw3ZFkrvJooHvlXZN2EMJ8xsL2krSz5bWH5IZwiqmMvvw9Qc0sSy30vD
         NmqHwwxnfIoReQ4ETAfHr5AdQJ2M5iARlfood5WIeTn8qAk9NBXlbuPplX6UMwgJGrL5
         kASZo4ZlpTQE5zwrRUKwOgB1ygNTimN3wYxxF54lXaeqr/qaccSB26ev+k4Voe5O6/CE
         fP7zDagujvUUHxFk7N8/5CMjkBKJ8IbqJMASia8SWduXSrKaejVH9jyhSMqygHKbz3VE
         kK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686312802; x=1688904802;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/d+dHBgEekjDSHClTJsQ6wFO80YgJRYqTq5jLwHrLwA=;
        b=i734dnvy1HOUquwKyHU6iVk1WouLOS69i9QhRXSXNd0ToCA4w70RJZfQW0D+/e2d2U
         1gaBQ97Qa52hz0NMb++fuy26ga5viJH0/GU1Qm6y2a1p9P24det8mGzlUQ6O3qKptB9F
         IeiTrTwSEYt12KPT3b9hE5XILZaP2VObUSzKWXeWgzz6S6DiOe4Damx6yh2QPb/7NOp+
         N36w25NwlIAG83fmg4WH9H1Km1eltQwtXEpf70Oz4UrhwE4MniT5UQ4joQfz/4gKoNwi
         zeR/uY5+dUUhlu4PusMasBTEtp2KKqIWwsqP1WhzKEN7iaGlJyhIGxa7qzQFU0i6yhpY
         G+DQ==
X-Gm-Message-State: AC+VfDy5GAgWwYZmZfRGlF1RN9yIQCG68cfzHzfTIQdxJQyVYeAfW7jq
	+kNBJz8bSRKubbcEHSirmFlunQ==
X-Google-Smtp-Source: ACHHUZ448AEQ91mBl1jmqqcGkRQTF/d2BTQKH4v4bK07JoAJsj99mIAC7VHg/3tDLGCNWOO1iKpbXA==
X-Received: by 2002:a17:907:d9e:b0:974:630a:fbac with SMTP id go30-20020a1709070d9e00b00974630afbacmr1485064ejc.18.1686312802221;
        Fri, 09 Jun 2023 05:13:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id e26-20020a1709062c1a00b00974556e50a6sm1223271ejh.114.2023.06.09.05.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 05:13:21 -0700 (PDT)
Message-ID: <3106c4a1-ce5b-a9c4-5cf4-6adead7fce80@linaro.org>
Date: Fri, 9 Jun 2023 14:13:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: aspeed: add Inventec
 starscream-bmc
Content-Language: en-US
To: =?UTF-8?B?Q2hlbi5QSiDpmbPmn4/ku7sgVEFP?= <Chen.PJ@inventec.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 "soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
References: <b039b1b2673644af84db8f803bc7d156@inventec.com>
 <c5f1fbb0e6754394af41eb5083f64d89@inventec.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c5f1fbb0e6754394af41eb5083f64d89@inventec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?B?WWUuVmljIOiRieWuh+a4hSBUQU8=?= <ye.vic@inventec.com>, =?UTF-8?B?SHVhbmcuQWxhbmcg6buD6Iux6YOOIFRBTw==?= <Huang.Alang@inventec.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 09/06/2023 13:52, Chen.PJ 陳柏任 TAO wrote:
> Document the new compatibles used on Inventec starscream-bmc
> 
> Signed-off-by: Chen PJ <Chen.pj@inventec.com>
> ---

Any reason to ignore what I wrote?

https://lore.kernel.org/all/2e06e7db-64f9-51f8-adf1-b240f30a2608@linaro.org/

You got there clear instruction, didn't you?

Best regards,
Krzysztof

