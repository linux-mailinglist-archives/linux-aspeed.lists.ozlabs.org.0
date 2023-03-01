Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D26F6A68B9
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Mar 2023 09:17:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRRtk03B6z3cGk
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Mar 2023 19:17:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PEowzYc9;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PEowzYc9;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRRtZ4GTYz3bgj
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Mar 2023 19:17:42 +1100 (AEDT)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 12FF420034;
	Wed,  1 Mar 2023 16:17:39 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1677658660;
	bh=woNoLas9qnFhgi2HTH7IsMcjNwAfQKmp4m9Er7VtDVM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PEowzYc9B2LIuyaK3BtrFQXwzP0mhCqomVvK6auctWuEl7bC4n4gQEolYh0fOSayt
	 pMjNbs6eU8bI7EBNuDvWmft769L1QQlRqHkktK83ncMVVfvkXPn3jNc50GKprhaVj/
	 kE9xlkgZzilRAaZ826hqzFuBr6RaIYtIFcMwqsM5oaGn2TMiV3EyyuxFzNrLvD6/Gv
	 mMt1Pu2i2d75yIQDWqnAWhvuB1JqgslY93DqOaJKZXp+QLwfbGbeY4eEEuQCPR0XTE
	 wrPbKoHCarqmMbXBnaFLU1y279IFDTKYAe4UBkF4U5JOJzD3lbvyHeW4JfbdHHAHGz
	 +dUFuYpvKWb1g==
Message-ID: <f5c9ecb7b1a850b196dfd3a5207f03226f514721.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 3/5] clk: ast2600: Add full configs for I3C clocks
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>
Date: Wed, 01 Mar 2023 16:17:39 +0800
In-Reply-To: <1024ddf2c4047e5a6cd516809d4d15ea5e0349b6.camel@codeconstruct.com.au>
References: <20230228091638.206569-1-jk@codeconstruct.com.au>
	 <20230228091638.206569-4-jk@codeconstruct.com.au>
	 <CACPK8XfZCaLK+1kRkHa+wvGyt3YCwiZDR7CKRPKxdjuBFH+01Q@mail.gmail.com>
	 <1024ddf2c4047e5a6cd516809d4d15ea5e0349b6.camel@codeconstruct.com.au>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-clk@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Joel,

> > > @@ -15,7 +16,7 @@
> > >=20
> > > =C2=A0#include "clk-aspeed.h"
> > >=20
> > > -#define ASPEED_G6_NUM_CLKS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 71
> > > +#define ASPEED_G6_NUM_CLKS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 72
> >=20
> > NUM_CLKS seems dangerous. Should we instead use
> > ARRAY_SIZE(aspeed_g6_gates)?
>=20
> Yep, that would have saved me some time debugging. That would suit as
> a separate change though, would you like it in the same series?

No wait, it's not just ARRAY_SIZE(aspeed_g6_gates), there's a bunch of
manually-configured clocks in the aspeed_g6_clk_data->hws[] array too.

This might require a bit more of a restructure if we want to get rid of
the NUM_CLKS definitions...

Cheers,


Jeremy
