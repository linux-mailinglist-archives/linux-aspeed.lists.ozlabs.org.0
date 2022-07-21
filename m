Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B52EE57C476
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Jul 2022 08:30:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpN4107Qbz3c5D
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Jul 2022 16:30:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xkdjRXXS;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xkdjRXXS;
	dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpN3v4pslz3bXy
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Jul 2022 16:30:33 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id u19so1315409lfs.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 20 Jul 2022 23:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xcSHceWIQnF46q/aNVeBbb+LJ3IAPo1mZRJeq73EWJs=;
        b=xkdjRXXSKPFngXKEevyXaU6z0Y4JPA+fQd9I+gp/Lw7u8+x3nQosofoJWDqHP5v7fL
         cMqHLlHUgmhIDEw8zlaeWcjljCrryhNz5czqOb1RIqBkL2A7BTnV4szadOf6lPfxyxgh
         f194VDrtFYHEi9uNROPbahBnY4H6507IaiVlMUsOkNojLaxTT9d1Kmi++zHFLCeBqhZC
         eIyLpQ3qbDLhS39KdK+gZ/Q0y4POeXAS3V2i6L2IvUqz5IQGAmglGpEukT4jp1lGSop8
         rDUmAJ+tPX/v479s07umER1RNq+c1kbuOdw1qnUJySCkgjXwuRAzMLnzSMWsra+QLDaO
         umvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xcSHceWIQnF46q/aNVeBbb+LJ3IAPo1mZRJeq73EWJs=;
        b=vnbJOShkR2E3tiWKDlwyuLZocMXPIMQI5vMhx9oim2xxqS2oWwuyGIydvpvCVIAkuw
         RC2xYINzYlin6xSmxG3VCfWHTyaGir4sEbwxjfYAyDVXjnShnoj5ejgWHlTvvjD6Sa+m
         f7LW5mj+4ZxHWic0yQ92rkDGQmdAfTyfVwFX7DVQWwSISuzDS+eLOXecX4AMhfJMTngq
         UmkqBRS5OqqGbzAr7TY8fcS39Wd5bSJwwQohV4SDGmqE38PObEyar4/8dgNZC/FoQroB
         CiuePR9AqEcNSU7QOMtWjMgJ0loALru+2+SmfYI7D+nE/BNkKD+NNirZo/DsIP612b8n
         yLPg==
X-Gm-Message-State: AJIora/fHEViN4CcvUwuooaC3wPIxb0NbGUzrXFuKMclDIEt3SWWohGM
	b688IuXMIKdbSY1gcDU3VWZPFg==
X-Google-Smtp-Source: AGRyM1shdQ1GO2vnK0GUcjpj/QQkvO+5wEzFWMbgSm9Shki8ovwWtZ4Z1Qxwdi2ud9QCMxp1+vVxpg==
X-Received: by 2002:a05:6512:1043:b0:48a:4996:a62c with SMTP id c3-20020a056512104300b0048a4996a62cmr7863341lfb.416.1658385025242;
        Wed, 20 Jul 2022 23:30:25 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id w2-20020a05651234c200b0048a6cb721ecsm240496lfr.26.2022.07.20.23.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 23:30:24 -0700 (PDT)
Message-ID: <fb1b5eed-41ed-2c4b-c984-235ec4b3b0f6@linaro.org>
Date: Thu, 21 Jul 2022 08:30:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/7] dt-bindings: vendor-prefixes: document several
 vendors for Aspeed BMC boards
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Steven Lee <steven_lee@aspeedtech.com>, Ken Chen <chen.kenyy@inventec.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org>
 <c86be8e0-8350-5d73-8055-e04a4e88f3b6@linaro.org>
 <42fb4884-e2c3-4d7f-9049-f14c19701b20@www.fastmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <42fb4884-e2c3-4d7f-9049-f14c19701b20@www.fastmail.com>
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
Cc: David Wang <David_Wang6097@jabil.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 21/07/2022 04:34, Andrew Jeffery wrote:
>> Any comments on this patchset? Are you going to pick it up? If you
>> prefer me taking it, I can, but new boards depend on the bindings, so
>> this should rather go via your tree.
> 
> Apologies for not getting to this earlier, but I see Rob's applied it.

Rob took only the first patch - vendor-prefix. The DTS patches I sent to
arm-soc.

However the second bindings patch [1] will miss merge window as I did
not send it to arm-soc. I have it in my tree but I am not planning to
push it out before merge window.

[1]
https://lore.kernel.org/all/165589284658.28441.1588047978357747292.b4-ty@linaro.org/


Best regards,
Krzysztof
