Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA44598EB4A
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Oct 2024 10:16:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lZp1dHfe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XK4Jw3gddz2yZS
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Oct 2024 18:16:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727943406;
	cv=none; b=fFIu1bSzK2++z9yk4fGSp3ES6zrqzNW8FEy+f30kENndyn9e/IDGGk+TTn+ORT5n3YdnYTJpVQb7UFD9EUGPvYcEOZc1YMeJt/Em2h5R88rypoWZUR0D2ABX/HBTb4j0nfvEmqP39wimmISwp83BOB3psSFfbVq3n+8AF+HX/Hckc3n9p4+xKMBcPZ/Xg64dKNJjAJbRPadb+EbODBX0/5+g0fypNSVL+kY/Jllsv/jNPHkPQay/M/lGq+GfUNCGY5Tya1neblTM2tnaINuo5hHF7sIeskuu2w4TJacLttE1aao4hO9Pwmp7VvUPkBQryOPWOrvJosb0yqHghZrKNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727943406; c=relaxed/relaxed;
	bh=kudw76ITehfexr3uNSsq2i2/EXgd7aXpbQkQYrNJbMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzIjcI6blrYYM9pLujCVDRoajV+j6WCNLV6lOVwBw1D2UmDqTbG7sCNS/bthhEAkUbCzxveAcl3lsL0mJzEuAzTAwrvH4jC1PZvvKKmfpo28jBDMOFHdadYLBuy0fyS/ATK0/tMNK75NzX8j9r7jXLF3iS7kWL3XhE5NnfDh4RZEjapXiibvRx0gVBtKraGN3mP05QAbo+AvTJcqARLikWAs3koa1edfHLNZmG2SnnmsV1gBFknotUUTkJMwuCXP03g+7CGjZNpZWOzYmRIk9d2bS4xCez4EEJ/k2KnkVtTmshjRJ8+TRdLPy5uAv1CPJaS1xqkwvcDymJ0ONU4tOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lZp1dHfe; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lZp1dHfe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XK4Jr5g8Jz2yTy
	for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Oct 2024 18:16:44 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9FF35A43467;
	Thu,  3 Oct 2024 08:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B26D8C4CECC;
	Thu,  3 Oct 2024 08:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727943401;
	bh=ZTEWdM9EQnqfcAqKF0YW4sdRl+S6oYuc7nTQKkdVdR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lZp1dHfeqxSSgekthOLOTBdngCa28+ZrfaepNDYBU0gKp8+j/geKT9bDPz8lNXSlm
	 lVC/F8oPScp1vFdAEcKB2K7e+T4LqLJTRLsw7JuxOUP1oCwroNkJBHB3ichvosytM0
	 2Vo/y5YvtbJ2AcZAgAePh2QY50fciQ4oSHZVgPot3bqegsAM+U1KLzb4VE3C0GRCLf
	 PRD8+BcU1eeWeFdQCS5KDTCTakZGmcYOuCv2sXKRwwaAmkynqY0i5It1kRyoMTYWQU
	 NjBxP4mizsmSJXDIS9/UWw55Q022jVZK6I+wL+bbZGwW+NxM2j2Yyw/X75Zn8qnv3n
	 EiDJ8sBb4FZgA==
Date: Thu, 3 Oct 2024 10:16:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Naresh Solanki <naresh.solanki@9elements.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: aspeed: add IBM SBP1 board
Message-ID: <vikiazbwxih7l4qcpoc5lhm6q5xwaitqnytt24nmr3prsos3jc@773uozmdlj6e>
References: <20241002084023.467383-1-naresh.solanki@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241002084023.467383-1-naresh.solanki@9elements.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Oct 02, 2024 at 02:10:17PM +0530, Naresh Solanki wrote:
> Document the new compatibles used on IBM SBP1.
> 
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> ---

Provide changelog explaining what happened here, including what changed
that tag is invalid/skipped.

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation: Please add
Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
or above your Signed-off-by tag. Tag is "received", when provided
in a message replied to you on the mailing list. Tools like b4 can help
here. However, there's no need to repost patches *only* to add the tags.
The upstream maintainer will do that for tags received on the version
they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof

