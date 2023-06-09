Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E312C729833
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Jun 2023 13:30:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QczQ92znbz3f8h
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Jun 2023 21:29:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YlzRxBhu;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YlzRxBhu;
	dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QczPy27tFz3dyN
	for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Jun 2023 21:29:39 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso2989843a12.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 09 Jun 2023 04:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686310173; x=1688902173;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kxiN7myur7/0GPCT/YlFEtOdpW5toTcI/Nywric3aLQ=;
        b=YlzRxBhuCSK70VDV0dZW+ujKcjhx4HbC1rs8EytAHb8rqlU6SU8hxNRMjHUD+QMhcn
         UCrjeGZXEMM8+CmUHgSFl6Tc+O25dEAVREpYDzcAitOG2vNHg8/NTeuZo7z2WQ3+JfzY
         EpDOvc/Z0L0VRXpe2f7gWbJvqhB84RZMSGPinvLDm+mTj4pHERZCtgyg1PQ6FU9Yi2DA
         V5A5Lu49VgLiRma5ieva3qSSZYRU5/U8YENcGSaYIBRiXcDKxVTntV2O1HuqVZF/XXAH
         hBfaDwo/jtGJ4V1aJeOplkASpUJ0UwbrjD8GZfdp/b5ZOJvBOyw+izn11YznXHe4umJO
         hHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686310173; x=1688902173;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kxiN7myur7/0GPCT/YlFEtOdpW5toTcI/Nywric3aLQ=;
        b=lfzAWYMEqdqb6VlHrpzYE7xgmE34BCCtrfxAkUbnrksv+GcVU+EOz9/wHHwjBVr9Tq
         yfX7Nsw2We/3dZKZrqzEG48Ni61q4Q79ybgaDbWBFtEgtJGG+hDXsXYqBseX7kSjjv9a
         pJjXrnijnYA6N0e1PetDsSaCVg4oGYDntuLZERzZfBb6+X4kNDvRPTpU1qje1GrGQhBz
         olEI3HaqPiP7/rdicnxu3XrQIL7KDwez9l1GiVCMLPv1Nr+WnaV2Vmd8bsqRlMpLdM5X
         yTBnwy6HAWHfN3uMV6lTVjrrPfkE7XyQmDnL2pUeg9ilNB2i4PmaxqyVDZHTvueSbb/U
         SYsA==
X-Gm-Message-State: AC+VfDxtSEJlGtbEVBjhXZVydMzJU42CadBWQJK4Dh5kKE9lk/VyxhBF
	lHQHmuVZVXjm+/aaZnvkm4SRkw==
X-Google-Smtp-Source: ACHHUZ4N8nCzxGEzlpoKN727/QlEt/dtap2HexlEjZXf6BjLVyzoQAOu7/kxf1+AaNNnWVFwP7S9rw==
X-Received: by 2002:a05:6402:14d6:b0:50b:5dbe:e0f6 with SMTP id f22-20020a05640214d600b0050b5dbee0f6mr1096342edx.25.1686310172919;
        Fri, 09 Jun 2023 04:29:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id e22-20020a056402149600b00501d73cfc86sm1661497edv.9.2023.06.09.04.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 04:29:32 -0700 (PDT)
Message-ID: <bff5ff40-fec2-123e-9896-6f5445289792@linaro.org>
Date: Fri, 9 Jun 2023 13:29:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 2/2] ARM: dts: aspeed: Adding Inventec Starscream BMC
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b039b1b2673644af84db8f803bc7d156@inventec.com>
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

On 09/06/2023 07:59, Chen.PJ 陳柏任 TAO wrote:
> Initial introduction of Inventec Starscream x86 family
> equipped with AST2600 BMC SoC.
> 
> Signed-off-by: Chen PJ <Chen.pj@inventec.com>
> 
> ---
>  V4 -> V5:
>   - Remove devices not defined in dt-binding yet.
>  V3 -> V4:
>   - Reply with devicetree binding
>     https://lore.kernel.org/all/28f0ce0a82464083ae24f9ef2f598425@inventec.com/

I received only this patch 2/2 and first patch is missing.

Best regards,
Krzysztof

