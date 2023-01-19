Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E78673631
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Jan 2023 11:58:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyKNR11Fxz3fCL
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Jan 2023 21:57:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qv/2sETl;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qv/2sETl;
	dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyKNK5R6zz3cfK
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Jan 2023 21:57:53 +1100 (AEDT)
Received: by mail-wm1-x32c.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso948690wms.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Jan 2023 02:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tMZR01owbHO/yW4TBPtf4cxNL344oUdxNVduW7eGBng=;
        b=qv/2sETlHaT2b412ALShAz7sRSaRxRyGYH2ui+PmwfkEeOg2MXXucIHOzhQLP2k57x
         6n1gT+gnKCdkYIX/GvdIbLhdG8jPuTjQo5yzmmOGWRJ0+5zwqtDfCaEmMl+nVGJd4P6I
         vBCJnISwzT77bbg/WrC4TvstliX9h1Uplr48op2/wFYCKTa67Qn2FlPw5qRIIYAoeedx
         3IUqlj708y4MAdlRBuiRR6L2gonhrY2vTGTqYz1LIpi4Tet11YnkRZiLQ2qXb+E3k/dO
         ptr4IrMJ9ZzoCz7+LbjZ0B0RR2NEVOG0MVDmQd/eID5UhXS04+ekh8AvU75ax3VMZ07L
         Em3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tMZR01owbHO/yW4TBPtf4cxNL344oUdxNVduW7eGBng=;
        b=vbIt4HswuESnM0D1NCLG+27uxkolv9+9KmKkdSFrwvjqfLeTZK+6natL/q6wyQ7dgQ
         FTFWkPxeEzJhVxPLu5Q1/BKjLWRdUKfjLRDSLIx9w6mkuFnZi5itvLh1jySa29EQF0Dj
         VkhHklO0HHxpE3L1btrXII/bP5OiDwifdVsIKFS1V5AhxL7ZxX+j1uKSWQoi3cFyQVEY
         etvTUitKb/3W6JhRokcJdaM51/uZhUDui/gtmBW4wGHM9HcjzARgsgKVTkqvGXp1EB0N
         wYozlXVKc+8qoUWNZbw32NyGTiPVbqtFqWXT7arJl+/rCdK37O9PRvWMF5nq1F+Jm2B9
         xbWA==
X-Gm-Message-State: AFqh2kojvcfPbWTUp8xvOkuF4jmuA2H+hebF8BsMEIHaQ8ikCA/nbFfa
	UklPvfyu77v+4E2YhB2Sp2KW5A==
X-Google-Smtp-Source: AMrXdXudIpOd+qWQZe68qqTI9Aial2kdhZzKSiyJFoq5LeI4WbkFtzkyokSjpPUwlOg9Uv1JVtFSXw==
X-Received: by 2002:a05:600c:1c8e:b0:3d9:e5f9:984c with SMTP id k14-20020a05600c1c8e00b003d9e5f9984cmr10187513wms.2.1674125870391;
        Thu, 19 Jan 2023 02:57:50 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h10-20020a05600c314a00b003db0659c454sm5631083wmo.32.2023.01.19.02.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 02:57:50 -0800 (PST)
Message-ID: <454e4783-2e42-847d-d03c-60741bb4b8ac@linaro.org>
Date: Thu, 19 Jan 2023 11:57:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/3] dt-bindings: arm: aspeed: document Ufispace NCPLite
 BMC
Content-Language: en-US
To: Jordan Chang <jordan.chang@ufispace.com>,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 joel@jms.id.au, andrew@aj.id.au, robh+dt@kernel.org
References: <20230119102102.73414-1-jordan.chang@ufispace.com>
 <20230119102102.73414-3-jordan.chang@ufispace.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230119102102.73414-3-jordan.chang@ufispace.com>
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

On 19/01/2023 11:21, Jordan Chang wrote:
> |This e-mail is confidential. If you are not the intended recipient, you
> must not disclose, |

Similar problem. Please drop and resend.

Best regards,
Krzysztof

