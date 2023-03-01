Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2C86A67A2
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Mar 2023 07:29:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRPTM5mmMz3c41
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Mar 2023 17:29:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZkNio0k9;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZkNio0k9;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRPTC3RCVz3bZv
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Mar 2023 17:29:03 +1100 (AEDT)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 099EF20034;
	Wed,  1 Mar 2023 14:28:59 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1677652141;
	bh=JjvivDnqcykLuKc8oV/hCmlttRnjTv4tkpSa4zDE59E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZkNio0k94N5gqhyrtKFIFOCSZsWnsTd//j1vm3Ay1y6URtoHvgJnpZbmewDviagEO
	 4u7htvGLsgOGm6qvxMRPVWfB5TwRhZmiK7BuT/LhWFjQ79TvT/zsyVz8fyXXXaU8c8
	 I8jhEi6YlzO19KASGx1DjGmiU3ow0F3Z6K5s/wn4aoSAPUjkzMFOGPH42EwXw2eLog
	 ky6rihrecxiwpYyUzJ1BvGal35LwkK+z3ziK6Ls2VdKJ2WTpxeXU/4jKKgNjYfJiuS
	 TpntvkNtYAb0MTl0Ymsi32Feo8cCCNPbGZ4wO3yZgq26bp7+Ce2wXCS7YTDJ0ZYs3I
	 oF/zbbsOZLdtw==
Message-ID: <cbbb99ce6125048667e4c41412710a61dc4d686f.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 5/5] dt-bindings: clock: ast2600: Add reset config
 for I3C
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>
Date: Wed, 01 Mar 2023 14:28:59 +0800
In-Reply-To: <CACPK8XcA_SES=Wo7vuWEJ4U5kTizM5brmb=6ELXD-taCFJQwgA@mail.gmail.com>
References: <20230228091638.206569-1-jk@codeconstruct.com.au>
	 <20230228091638.206569-6-jk@codeconstruct.com.au>
	 <CACPK8XcA_SES=Wo7vuWEJ4U5kTizM5brmb=6ELXD-taCFJQwgA@mail.gmail.com>
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

> > diff --git a/include/dt-bindings/clock/ast2600-clock.h
> > b/include/dt-bindings/clock/ast2600-clock.h
> > index b4d69103d722..b1c129977910 100644
> > --- a/include/dt-bindings/clock/ast2600-clock.h
> > +++ b/include/dt-bindings/clock/ast2600-clock.h
> > @@ -90,6 +90,12 @@
> > =C2=A0/* Only list resets here that are not part of a gate */
>=20
> These definitions are part of a gate, yeah?

Well, no more "part of a gate" than all of the other definitions :)

All the defines in this section are references to individual bits in
the reset register banks in SCU040 & SCU050; the i3c set are the same
as the others there.

So I'm not sure what that comment is supposed to signify as to what
qualifies as a "gate" in the context of a reset...

Cheers,


Jeremy
