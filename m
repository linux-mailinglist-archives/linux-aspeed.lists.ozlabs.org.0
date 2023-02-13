Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C06693D2D
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 04:54:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFVpR2Nt6z3bZl
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 14:54:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PUObLmv5;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PUObLmv5;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFVpL0zsmz2xJN
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 14:54:34 +1100 (AEDT)
Received: from [172.16.71.140] (unknown [49.255.141.98])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id EF8332003E;
	Mon, 13 Feb 2023 11:54:32 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676260473;
	bh=mUfFYcXZpoqiWPyS7snd3gAYhXm4wWJgRfkE2yTX8pA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PUObLmv5nRKC+i6HNjXqn82vFp4X4/cgfM9luCZm0CYPnWBDo5pk0/6T9muxgWfpq
	 MG7hbRrVjnGI/BSOGyM0idC3vPipFjH9PekiH+CO/GS0+c5J68eZSwy+WLMZdM5JR1
	 2FDZnjBCHp5vrcLPo9/gkhsdgB05QIsp31ipaaIr+br/hiMxq8AQp6A/ULqv+zx4Fm
	 hjKrJG+8Ql+d9wRnMPyTdz1WwQCXQtQXQxGXRHMDVvSV6CkSZ6CsZ+/CAAyNF8qRVH
	 XNpbI7lQuNugFjuEa4WoHe9qw+Fk+7/e+1b30SBWixeCK6p+St7yXlQyEjbLrg5EgU
	 FS10HRY2OUskA==
Message-ID: <7b98182e6ebbfe63aa327f363bd288b9e1736a6d.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/2] Add definitions for AST2600 i3c clocks and resets
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Date: Mon, 13 Feb 2023 11:54:32 +0800
In-Reply-To: <cover.1676259904.git.jk@codeconstruct.com.au>
References: <cover.1676259904.git.jk@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi all,

> This series adds some base configuration for the i3c controllers on
> ast2600 hardware. We'll use the reset and clock definitions in the
> proposed dt binding example, hence sending these first.

Looks like I had Joel's address incorrect there; fixed in this reply.

Joel, let me know if you'd like a re-send (but you should also have a
copy through linux-aspeed?).

Cheers,


Jeremy
