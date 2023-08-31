Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5869D78ED57
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Aug 2023 14:38:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=N1tU6akQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rc10l4D73z3bvW
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Aug 2023 22:38:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=N1tU6akQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rc10d50H2z307h
	for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Aug 2023 22:38:07 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99c1f6f3884so86061466b.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Aug 2023 05:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693485484; x=1694090284; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oi/kPn02IZFct2zYJEPtTAuOz/cjkMO9segcjaWjsPU=;
        b=N1tU6akQ5PtKIP7SIPJh5zlTiVBI70tsk+kGiivDDUzwhjm9+VWZl391BRQCWNnKjK
         igCNiNLEepKErKj1TxfAQLNV17APEOcyG1E9KeV9npHqlDw/PAs8BocF8zBeE8w6gce9
         2EPEuXvRoh/7Odg6dQwKBlnXmnlUkcyUwEGY+uXJo6Pcx0fJFMcWxwTzCyuUqsHIaeQm
         U1uB4W74qJmGquiMDhHDVpHeCVIa4mqn98B3E139Glazepkx74r/8AI2+2IZUUxV7ByJ
         lFLNonUl5USD+u84IlA0nV+brvd2/hvVYuufJgvTTp9TIZ6kE269LaBUC4v7uyVeecD/
         4yaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693485484; x=1694090284;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oi/kPn02IZFct2zYJEPtTAuOz/cjkMO9segcjaWjsPU=;
        b=Nglhnv4eYE+o9BYlAdYEyYNFJnIX2pjZmw1Jx+jc6GfHr16vcpvmJa40K2OMpafb6D
         1DMsXZDHv6VRKjF1yWe62J1hvpLh0lw6Of2ybCppG6d+jQlpiKz0RmiyN4oiea3iTP87
         sbHG0VAeiWiqW2gLhwmtDthNE25GEFfRNysbtu72S+2eG/wBTneSpT7p0QKeU/knWXYY
         W2roAJ4LguCU/6jcRSdqXun94BSnnUIpNTWGFgMeIj3dydnVU7U86/0vm+vRTk1uw15O
         WjKTjK5rfWR3q2y2Eo7ALzQy+kHT193GqL/gBOeqR6Iz9y+yQVO/FHKbmr6EKN6TZk2m
         hjzQ==
X-Gm-Message-State: AOJu0YytpPXk8MXwQPCac/eAhHpezh2mKHUreMh4RQ+yNkFGOjOsspAv
	OOaYSyrMpIiM1n0z7n2TG3O86w==
X-Google-Smtp-Source: AGHT+IG66AMgUP5PIYRzzikgOWnqFE+4vnEiMaeZV40mxCPYbDRmK8oHkefsRLF75BkzCPNNJnRbmw==
X-Received: by 2002:a17:906:2d9:b0:9a1:d79a:4193 with SMTP id 25-20020a17090602d900b009a1d79a4193mr4105717ejk.23.1693485484212;
        Thu, 31 Aug 2023 05:38:04 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id p27-20020a17090635db00b009a168ab6ee2sm701844ejb.164.2023.08.31.05.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 05:38:03 -0700 (PDT)
Message-ID: <7b241edd-4775-afbc-e5a1-63f5ecfce331@linaro.org>
Date: Thu, 31 Aug 2023 14:38:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v7 2/2] dt-bindings: arm: aspeed: add Meta Minerva board
Content-Language: en-US
To: Peter Yin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230831082819.4000425-1-peteryin.openbmc@gmail.com>
 <20230831082819.4000425-3-peteryin.openbmc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230831082819.4000425-3-peteryin.openbmc@gmail.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 31/08/2023 10:28, Peter Yin wrote:
> Document the new compatibles used on Meta Minerva.
> 
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof

