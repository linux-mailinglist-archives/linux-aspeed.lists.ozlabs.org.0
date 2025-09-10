Return-Path: <linux-aspeed+bounces-2188-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD7AB50E89
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Sep 2025 08:55:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMBJl6tmbz3clh;
	Wed, 10 Sep 2025 16:55:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757487303;
	cv=none; b=mA+90nEgCXvuWDFKOJ6C4XERR1H0ylpFETsRflpYHR/oB9wGQRumx46KCZQSyrhQ9hHx28uuG7oMh/qyeh2BxxGxaGDECRpD1NZlmj8tFbUAHbgpDAOIvpZV8kyLcFIQ9T3sh2oQDsR4DJsXxEe2azMaGlSfmKyqLiaJeRBJoMtpyk0A+RvFMCCeG6nqjiBpUF1pDBpW+4pTVDPdN7LSBGOI7IG3tawLC9I49K5W3UqIa9Qr20HnTnzYpGwiqnNlrC6q2e4z0lHCe2wUY9xxgCL3m9xnoZFyaOGpSCNKGH3kaiuDgjOYnJTm5nuIerHj/mVnX30DVfzITHCfDLUngw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757487303; c=relaxed/relaxed;
	bh=oe3cxkXt/q2JPyVdIDXoHlk1IlmJAzFO2nNbBbqCMZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bBC3JsYcYWC7mZipvE6Q3J0PpaWnen/0OfcOlzW/raxvO8qelQ5wLA0mfsJVLe6CYc+yb+/pTilmVqLGKiilZZ0/8jpzBxd3xXG0jekYx3P42tzu3dV6GxC3lVBc5Ai82MDL+SCvOy/DjzpILUImS03oCcYgWr2kb1oeuavDmDWw2tPstzCMVM1qQ1QN4NgM8IjkGQHvcF8QwLDi+vwEHJBWoCjMDjeevcX/2KkQaX6ww8IbUgIZ+44h3xwyd48jr783pbTSLW4v0akFfVyQaDnZzMjMY1faScxevpjFXYDUtpXWUSQw+k1AcuAS5SkO2zoBLpdRixowWYv3CVJjow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Wm52vjo0; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Wm52vjo0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMBJl3gnSz3ckL
	for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Sep 2025 16:55:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1757487302;
	bh=oe3cxkXt/q2JPyVdIDXoHlk1IlmJAzFO2nNbBbqCMZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Wm52vjo0yGm9yLddJf8W6MO2tmsTQreghqcEGUTooX0HuiOyhYgcc1JAOegg9qIA4
	 ZKi4Hz2FywXjQfEbMuB68TvFcgR1u6hXWpa8DZMXLC+N6RJlW43Hu5hraj1Knqqn9l
	 y3fLQ4CESLbcdxW/4S6OhaLINhbpIa2NEncQQ4AfpfmKvYpMLRk+4re6sLuwTmBAiG
	 Ih2qA3w80tGIvp5WCexHdpkL0QzQg5BHcWifLTXW39ycRy/p8BNO7hMVzVL4T58MNH
	 vMR8nzf11pQXEqTlh3OlxaCHqufvWGzWu0zxqJ5YtbXabDpyo6+HyVWcW1JClAhFm/
	 t/ADaFTCPoBug==
Received: from [127.0.1.1] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7B3286443C;
	Wed, 10 Sep 2025 14:55:02 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250829211330.1336274-1-robh@kernel.org>
References: <20250829211330.1336274-1-robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: aspeed: Drop syscon "reg-io-width"
 properties
Message-Id: <175748730236.660876.7704019071552566777.b4-ty@codeconstruct.com.au>
Date: Wed, 10 Sep 2025 16:25:02 +0930
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 29 Aug 2025 16:13:29 -0500, Rob Herring (Arm) wrote:
> The default width is 4 bytes for "syscon" devices, so "reg-io-width" is
> redundant and can be dropped.
> 
> 

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


