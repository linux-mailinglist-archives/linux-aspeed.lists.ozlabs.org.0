Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF0F68ECD2
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Feb 2023 11:28:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBbnK3knxz3cgT
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Feb 2023 21:28:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xaSM/jWq;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xaSM/jWq;
	dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBbnF3KxBz3bcN
	for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Feb 2023 21:28:33 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so1086278wmb.5
        for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Feb 2023 02:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MFc/zShdZ2vyU1OZpHtlfV+CGb2m53vsLYDRUV8liWI=;
        b=xaSM/jWqR6bQkqcxRtJzlOIT03gykSIhaTbvPUkNx0hbnwJmnYFkF+Zu6onPA4HRmG
         lXZgaUjDO/LT0hRHLdbRWGj56GduycCESGBibQdAxpTNcqZvflWnTkyuF5XK0/9kvzgy
         X2TjP7qCZcCogDWcI2pLS4qlWHZ2vVoNCMLUEcTzNc0jBSO+/tSGithhcb7UyIW+GoLt
         gOoxfrwx7YcUxwvYJCVY2WzaDGXZ1set1RCnzN9mHMxBg28o48MrHNjPTQVzG3IGTK8C
         7j3XYMoIHeDe1t6Xs1c76vcXl8oJYhj6Ti38b/IvqwTt7ctrY0tsBD3dTEgxEe3unT4Q
         8qKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MFc/zShdZ2vyU1OZpHtlfV+CGb2m53vsLYDRUV8liWI=;
        b=PaMbMFOSx3m8A7UFNSympsWYjiohvDR7GrQljl/bsuQaHZXsNC9WVuGrazUZ2B2+KD
         tCbl/8Us1sIot4gUCkWpGcKnh7oGlSDmMb8+B4pCKheyhNV4uecPKTPJLL+O4VX8pJ6y
         9rZAKz6YXr4DqH+53cIvHCl2vpJVZIDsuO5UnCTAEa/jSmwjH+nkE4MaaQPDo7EiXror
         4WU746wWXHrSRwekXP7MDpcv59n85EXF+UkFgGnAy9UG3/ufQ+6K3VGMJHUfb2m+iAsQ
         xVjm0ndYCbprDA4NmA2U7Y9p69ekUWg7T9yAdSFgXCuh8GkdW1h9BClELetwV2JGBS6f
         jW9A==
X-Gm-Message-State: AO0yUKVsOPAocKAS9Ig4K/NxtbXtSI0YkmrmW5JtFQ1NrFiGCxetLdDN
	VzdGgSbB3msUVGFZZ/rT9wJ8kA==
X-Google-Smtp-Source: AK7set8U9QhWOzH/AO4xLLOtmHz339mkzSlM2XELZI6NMCjYgropZNgWwZTUW546mef+UUALSnQp/Q==
X-Received: by 2002:a05:600c:3089:b0:3e0:270f:dc88 with SMTP id g9-20020a05600c308900b003e0270fdc88mr4532053wmn.33.1675852112916;
        Wed, 08 Feb 2023 02:28:32 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g20-20020a7bc4d4000000b003a3442f1229sm1492099wmk.29.2023.02.08.02.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 02:28:32 -0800 (PST)
Message-ID: <6855cd0d-16ed-a55f-5a03-32a127fd9bb2@linaro.org>
Date: Wed, 8 Feb 2023 11:28:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: aspeed: document Ufispace
 NCPLite BMC
Content-Language: en-US
To: Jordan Chang <jordan.chang@ufispace.com>,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 joel@jms.id.au, andrew@aj.id.au, robh+dt@kernel.org
References: <20230202081843.2358-1-jordan.chang@ufispace.com>
 <20230202081843.2358-3-jordan.chang@ufispace.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202081843.2358-3-jordan.chang@ufispace.com>
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
Cc: jay.tc.lin@ufispace.com, eason.ys.huang@ufispace.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 02/02/2023 09:18, Jordan Chang wrote:
> Document Ufispace NCPLite board compatible.
> 
> Signed-off-by: Jordan Chang <jordan.chang@ufispace.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

