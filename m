Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8430608E6A
	for <lists+linux-aspeed@lfdr.de>; Sat, 22 Oct 2022 18:20:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mvmly4rlgz30F7
	for <lists+linux-aspeed@lfdr.de>; Sun, 23 Oct 2022 03:20:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tOG0B42B;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2001:4860:4864:20::2b; helo=mail-oa1-x2b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tOG0B42B;
	dkim-atps=neutral
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mvmlp435Rz3bqw
	for <linux-aspeed@lists.ozlabs.org>; Sun, 23 Oct 2022 03:20:37 +1100 (AEDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-13b6336a1acso1698442fac.3
        for <linux-aspeed@lists.ozlabs.org>; Sat, 22 Oct 2022 09:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oP+OivOlJKby7VX0wt07yv8oqh7iwPhSwvHGsEi8ePI=;
        b=tOG0B42BsdazxfhzuTyBJ7MA1j+4BSyU7mlZLhPC+gv21gipF1srZBPJ6Tl0G+18gn
         /9Rsu+duFErhwGXP51ACbYH9ri2zA30YUIdygtg91JoQYs5Oixg53edGQpekz86QBmG9
         +22xyQ8DP6kf5d829+L20tN78RFNfzI5s6nR9QYwnz5snTQ7IMePeC0GFnfdNqlhemkk
         bdoluDTNW8y/ISAzRbs493FQ2BX3RC7o5Rl6oZSZvlVehTYIKPHIR29KBbonMGjX84yB
         n7aSWintkxx6mWv2lSFDqIorHujWmSKhdETTdedqQK7ZpP/ROOUzdt1/QVsL86XuTrzl
         sWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oP+OivOlJKby7VX0wt07yv8oqh7iwPhSwvHGsEi8ePI=;
        b=rc5T5G83ZVH8NB1IM0/ImXA7j57Rt4wXjIUS84FUd1KHfYTO6Ol2070HX8/nKQfMPV
         W5YLa/QGxa7wsIQTrt/N/drSmz2RHm5/hM0M+rvI1hI31orT1CoXLlrfZSKkz3RfKx2q
         +7S44TNtNzod+7Eo/PV8RXyX3+n1yKb+O+JKz7OCL7CmOs9RImjnXmxmFNo+8lo4dufd
         WLnmlIq0gLoeyLRSvH7foS9+u4ap0SsXQvb8wcZszSmRY9Xa0ksqvOGl3W6lHhHIybfM
         6pH1JO0bEJViYOtPMKn2K3Y7vr9Sbml4nuJi2FfJCmJYYlQ2Bq8XCUNYSxhjJ0sNDQug
         H8Og==
X-Gm-Message-State: ACrzQf1zku/KkVtYJZP17iAsYSGiYgCJJo8VrMrIbYcpM7t/ajwol68t
	GnJPDkQkf6zSIzxc6Es+675iSw==
X-Google-Smtp-Source: AMsMyM5HZNHKBt3bPjg0ZWDzXEdMLa6L5POsBmjhsTM00sVzPQsTy/DfF+ZSjY7MoJ8YpzkahPsDRQ==
X-Received: by 2002:a05:6870:c58b:b0:131:9324:60fd with SMTP id ba11-20020a056870c58b00b00131932460fdmr33558787oab.154.1666455633180;
        Sat, 22 Oct 2022 09:20:33 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
        by smtp.gmail.com with ESMTPSA id 32-20020a9d0323000000b00660d7fbf13dsm2373160otv.51.2022.10.22.09.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Oct 2022 09:20:32 -0700 (PDT)
Message-ID: <bac3646a-13f3-9031-c5e6-b5d24e0d9514@linaro.org>
Date: Sat, 22 Oct 2022 12:20:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: aspeed: Document
 aspeed,pre-timeout-irq-us
Content-Language: en-US
To: Eddie James <eajames@linux.ibm.com>, linux-watchdog@vger.kernel.org
References: <20221021151559.781983-1-eajames@linux.ibm.com>
 <20221021151559.781983-3-eajames@linux.ibm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021151559.781983-3-eajames@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wim@linux-watchdog.org, linux@roeck-us.net
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 21/10/2022 11:15, Eddie James wrote:
> Document this new property for the pre-timeout interrupt.

Please convert bindings to DT schema first.

Best regards,
Krzysztof

