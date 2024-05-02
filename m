Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 083A58B9F65
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2024 19:23:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pEw//myQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVgl43dkVz3cVm
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 May 2024 03:23:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pEw//myQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVgkx3K93z3cFN
	for <linux-aspeed@lists.ozlabs.org>; Fri,  3 May 2024 03:23:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9D108CE13BD;
	Thu,  2 May 2024 17:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0581FC113CC;
	Thu,  2 May 2024 17:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714670612;
	bh=VnsaxWRKYnVr47uFHyKJNESO4A+VCX3F1VXJeDiJ/wE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pEw//myQGuRYUqtOXZmIxXyH4H0J8VfltjfUEy33nM03vSVHns36q/Bjn64wncMoI
	 rwzMZJVErkdkTx8k+ppDCwWTrsXFKHtC5L+9XiJnw6VL2dMRM04xB2sPTiZAr+2r6I
	 3O2v8YpabggFwN0qP1dYNJNNKp3Q/CoJOe8Ob9VaxBrTN5Wt0byFZlanRNobwQsZhc
	 JqoVg3++raHpIwZsZgwxtCQDiMwHeUB8K/wo1mWA0sFjaeSwVYOOgimfHt7GZQjW6c
	 +C3s9FbIV5aWZH0Y92nf03YMyI4PZ7DlEFS6dP0iKCYXIJgO+jz+CkPoNj9MuhIlgZ
	 MjM0Y0hEu9BiA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20240430172520.535179-1-robh@kernel.org>
References: <20240430172520.535179-1-robh@kernel.org>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: aspeed: Drop 'oneOf' for
 pinctrl node
Message-Id: <171467060972.1223907.593520549880230505.b4-ty@kernel.org>
Date: Thu, 02 May 2024 18:23:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
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

On Tue, 30 Apr 2024 12:25:19 -0500, Rob Herring (Arm) wrote:
> The use of 'oneOf' to include 1 of 3 possible child node schemas results
> in error messages containing the actual error message(s) for the correct
> SoC buried in the tons of error messages from the 2 schemas that don't
> apply. It also causes the pinctrl schema to be applied twice as it will
> be applied when the compatible matches.
> 
> All that's really needed in the parent schema is to ensure one of the
> possible compatible strings is present in the pinctrl node so that its
> schema will be applied separately.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: mfd: aspeed: Drop 'oneOf' for pinctrl node
      commit: 8f553c27697bc5e11074e37dfc0def6e39e489b2

--
Lee Jones [李琼斯]

