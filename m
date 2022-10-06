Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 739065F615F
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Oct 2022 09:07:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjjDS2l13z3bry
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Oct 2022 18:07:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m3VBjRSH;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m3VBjRSH;
	dkim-atps=neutral
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjjDM3fWvz2xy6
	for <linux-aspeed@lists.ozlabs.org>; Thu,  6 Oct 2022 18:06:58 +1100 (AEDT)
Received: by mail-lj1-x22b.google.com with SMTP id p5so1140628ljc.13
        for <linux-aspeed@lists.ozlabs.org>; Thu, 06 Oct 2022 00:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=9mXNHzVsTEVd4935gfs6itkkTtXeUwH+rKIsrH0IphA=;
        b=m3VBjRSHJ3vBNgKD1XqaNRXrJhDyLwgu4IYJoJdczIXENYvuMqanwMtuz0I+56aQW0
         VxD03n6CHVIEl8rU3Muj6ubWiI+eBy2borRnlLhWMzwWkQHN8NzJAdPpPRpFfzf3LorV
         XE4VsGCONaFzfjL1DvkVoDWLEv2DyVnvMmlIvh6IFOx3SWlSkBL/dC5ZXchmgK8ezV/b
         TydjWWDUGvXneDerdL58e6kXDtttURX9HKSxSPIjTjDbHBPK5Au0QFe5Qra+t0TWe3gA
         Fmahy8C7lQQZswkBv3GnXZMuLoIfo857LGraeEDnuzw5hnKeh7YTHv0gDLfTdV1jtBod
         0ecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=9mXNHzVsTEVd4935gfs6itkkTtXeUwH+rKIsrH0IphA=;
        b=NLXQwbMXSqoxFRzuYdcPuSbOMDuZmqlwcuu5IISxoWsV865ASZGfy9SklooPOKVHBW
         q+fwerpNUDAL4aFCXTKpF8bpmYBUroeuzdTnczOoqGFfYMzpvCFbyCHJwdZ1M3F361U2
         CoCNSqmy9hpQHfu7L71Yo9/pUguFzNMbNQelKZy9uHjZY4YSd8uSSdRX1LNX0OU4HLK0
         m7Y8ge6fAOowY6O7V84Ms4ve4SM1dqaaA3ZHz7cHbNt1o122JdKXkK2WsO9MmNJlQYk9
         7ZLJQu2gK+rOmutjb+LkTt2UsYskXeWr2Ww2eNaXE4qzb9irrfbnC9cwCOeEqJjSwaye
         roZg==
X-Gm-Message-State: ACrzQf0/kqQ2sByAn/EhkRdQTHlUevrrAiWBgoQu+Bu1r79QRFSG3Flv
	c9N4gVf4+jEOMJRMpxipsIcl0w==
X-Google-Smtp-Source: AMsMyM6+yDM1ZMdH/zd3pXzG8dDRC6Zf7oHMK+3sqCskkXS5zdXqyvSMe5z/xvbwPsBETQMXnf9ulQ==
X-Received: by 2002:a2e:a370:0:b0:26d:d69f:5aff with SMTP id i16-20020a2ea370000000b0026dd69f5affmr1227102ljn.319.1665040010345;
        Thu, 06 Oct 2022 00:06:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g22-20020a05651222d600b00485caa0f5dfsm2601158lfu.44.2022.10.06.00.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 00:06:49 -0700 (PDT)
Message-ID: <8d26031e-c595-5d4a-7874-4d3a14834755@linaro.org>
Date: Thu, 6 Oct 2022 09:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v1 1/2] greatlakes: dts: Add Facebook greatlakes (AST2600)
 BMC
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
 krzysztof.kozlowski@linaro.or
References: <20221006063527.2007802-1-Delphine_CC_Chiu@Wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221006063527.2007802-1-Delphine_CC_Chiu@Wiwynn.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, garnermic@fb.com, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 06/10/2022 08:35, Delphine CC Chiu wrote:
> Document the new compatibles used on Facebook Greatlakes
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> ---

This is v2, not v1.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

