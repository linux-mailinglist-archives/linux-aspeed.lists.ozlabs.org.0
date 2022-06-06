Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D95553EE94
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Jun 2022 21:26:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LH3Pp48D9z3bkH
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Jun 2022 05:26:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.41; helo=mail-io1-f41.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LH3Ph57V8z2yn3
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Jun 2022 05:26:15 +1000 (AEST)
Received: by mail-io1-f41.google.com with SMTP id s26so3371663ioa.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Jun 2022 12:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nUwoRK1Vj+8sy8SVxzKcJRhrQsEifyPzc9VgrjwL4ek=;
        b=wGHhokdoiYCtte0c7JQCSbUFHWz3l48tzfaMWLInpJm/BmwaQgF2mfqzxSULl9iD9b
         UqiosYO+gtjNY+PndR6VE6a7cwgf2YGqihXYcxRcNDrhouMDh/NoLjFBqiG+arr4rMsN
         /8zQuZK0yDug3BhayupHv6VnUDpI+dEMFxFlKNvsL12K9y/IUiQwGh9XXv7qy9Cn+Zc+
         889LXKudKdXYZ7pfifPaKtRghZpoIIq+5MIayxhnxX9lNvmpIU8RQWXkAI01jEHrzu48
         XG6ztZZ4YHLgs5vh9Tl5DXVKz1nxUbEk+/cLNW3Qm/BShIW0/AP4e8gJt7Q1Wly0mwG/
         PkwQ==
X-Gm-Message-State: AOAM531SqeSeBtb7C+qFv3nmL17RFMIyFeQPM6ZQSjLYWyihI/fy28bn
	fXsOvaBN5g2sWI7JsoRm7w==
X-Google-Smtp-Source: ABdhPJwhKTtphn6QN1OHiDFAVtAMaOl9ZTMicC/Fve+VnI1gdtbJ/yYlFWee0L6fHMGLVQMiwrx82A==
X-Received: by 2002:a02:ba82:0:b0:331:5aaf:e4b0 with SMTP id g2-20020a02ba82000000b003315aafe4b0mr13869104jao.196.1654543572788;
        Mon, 06 Jun 2022 12:26:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id m12-20020a6b7c0c000000b006694b2de3bbsm1874997iok.11.2022.06.06.12.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 12:26:12 -0700 (PDT)
Received: (nullmailer pid 1117627 invoked by uid 1000);
	Mon, 06 Jun 2022 19:26:10 -0000
Date: Mon, 6 Jun 2022 14:26:10 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 3/7] dt-bindings: arm: aspeed: add Aspeed Evaluation
 boards
Message-ID: <20220606192610.GA1117514-robh@kernel.org>
References: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org>
 <20220529104928.79636-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220529104928.79636-3-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org, David Wang <David_Wang6097@jabil.com>, Steven Lee <steven_lee@aspeedtech.com>, linux-kernel@vger.kernel.org, Ken Chen <chen.kenyy@inventec.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, 29 May 2022 12:49:24 +0200, Krzysztof Kozlowski wrote:
> Document the new compatibles used on Aspeed Evaluation boards.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
