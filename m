Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D95CF77DA43
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Aug 2023 08:09:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uoJ+LTaG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQd5Q5VVRz3cVB
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Aug 2023 16:09:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uoJ+LTaG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQd332TmZz304b
	for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Aug 2023 16:07:42 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31781e15a0cso5403233f8f.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Aug 2023 23:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692166059; x=1692770859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FsYZ939dcLj42q9uy/F44+/jrXXmiBF/awHAuWPvXAk=;
        b=uoJ+LTaG3QZMIz/ZFLv0qitRtNF1EyLtA5yKAhtE0OP5ZF3SDoPOryh+VBT2oJIdZR
         HzuvuvrrGmTfQcJWx1qjBb82be5InQkZkimokkpc6WFYWTThE03x5RDOF5i5RzbiufBU
         k8bruS4aN0nVlwIpq8CMZtnJRo2kutK1aW4gPOHB6XhQ3t/UTuABsHe/EblA5UzRhSOe
         BVMNFLuhMUuF+/2bR5fOkHe93l6aaymbU8tgOUAMFb22GQXtRrUOmxzN7Nq+6AFNp2Hv
         XXo7PP2XgKMS7EhbP3na6XXN9z+/DXSh4vMwE06+Pp6o+J9lk3wdK2NEgkjDbwWXLFn2
         gSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692166059; x=1692770859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FsYZ939dcLj42q9uy/F44+/jrXXmiBF/awHAuWPvXAk=;
        b=QcZLqcy/eLsyKpvazCqFTW7K8c9M4MJaQJqt8/VQRWSNkuyToM5p5R9GJ8BuYXSVlq
         z7ji0s2Dvg36KEiZtWgMG4/R36OY+u4apVCqBbXOc6UdE0ZypTV8p58RGoUnrKwMpWvm
         Jqx9jDG5B8rasgLch8oM/VN13ii7KGdACYM185QUuXngbkKfcFSzOhJEVEnDg/2xQ+qZ
         MJzGuwLFDgo8oimNc+bnkQbkluAC4kwSIRoko6ZTPUQJEAKqTPpmKej9+BjoM0UXOKWQ
         irhFYWG27fb0VrMbZ9xuBlqKG8LvW/V4Y2o3E79harjJBqGhRElBdnf3evCekKcZcdhB
         XyrQ==
X-Gm-Message-State: AOJu0YzQXXvWh0rXpF2K1E+cqKMFHDL3dET39bdcUUPibXSC2GB1FxE2
	Ek/PEjX3pQxihpDuehAGGhzH2Q==
X-Google-Smtp-Source: AGHT+IER5sMU2fdIlArto/rLhBPLokkQ2ZvUUXeHU0aH2Ely9ASzANipMTVKXsFzMCMuJLWXHwMwYQ==
X-Received: by 2002:adf:dd84:0:b0:317:4bdc:6f34 with SMTP id x4-20020adfdd84000000b003174bdc6f34mr710578wrl.64.1692166059333;
        Tue, 15 Aug 2023 23:07:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b003197c2316ecsm7456530wru.112.2023.08.15.23.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 23:07:38 -0700 (PDT)
Message-ID: <5ec6669f-454f-5c50-7ab2-522940f2c57e@linaro.org>
Date: Wed, 16 Aug 2023 08:07:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH linux dev-6.1 v1 1/2] dt-bindings: arm: aspeed: add Meta
 Yosemite 4 board
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, openbmc@lists.ozlabs.org,
 patrick@stwcx.xyz, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20230816060547.40489-1-Delphine_CC_Chiu@wiwynn.com>
 <20230816060547.40489-2-Delphine_CC_Chiu@wiwynn.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230816060547.40489-2-Delphine_CC_Chiu@wiwynn.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 16/08/2023 08:05, Delphine CC Chiu wrote:
> Document the new compatibles used on Meta Yosemite 4.
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>

I don't understand this patch prefix and why we are Cc-ed on some v6.1
work. Please split your downstream work not to involve upstream.

Best regards,
Krzysztof

