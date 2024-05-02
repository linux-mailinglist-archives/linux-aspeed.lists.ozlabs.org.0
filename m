Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1958B930F
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2024 03:16:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jRQ9UR1Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVGH211ZPz3bwL
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2024 11:16:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jRQ9UR1Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVGGx1Mg0z3btk
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2024 11:16:25 +1000 (AEST)
Received: from [192.168.148.88] (unknown [120.20.105.107])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AF26D20009;
	Thu,  2 May 2024 09:16:23 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1714612584;
	bh=I1H2b5dmLu+h090Wf3JV8wPJG4mgtbGH1NdOaoBnM7U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jRQ9UR1ZZ2FVs0XozVicmEwg1CRNhSKmKccCABEs31nGicFn/2prKvEeQ2rbh+rWa
	 WAaWf/S4eh7Lp/yTx0jVmqReJh/6AlvwZAFcK/6YQ0uAo/NfkeUqNEAxQQ76DSIHdS
	 HUzavRDOacprdfMmSg0DbVM7TTH/3qWIL2E69NZwhYRo6bexYncEA03PzojNt2gCaQ
	 kchPJIOrTNKRxid89ZHpzHIVThucjhfR7q/y5kkaxLOja2otHPXBjoFCoevzrcNSUF
	 9rf2y4Dkp1mgEwkaDZp44VxNdZrn+ev3hdWMwvdOt8ytjK/6LOLPUhbUJV1FlTMzS4
	 aHu5HfKEy+b4A==
Message-ID: <73284390fda1971eb6727102eba75324a1886a2a.camel@codeconstruct.com.au>
Subject: Re: [PATCH] dt-bindings: mfd: aspeed: Drop 'oneOf' for pinctrl node
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>
Date: Thu, 02 May 2024 10:46:23 +0930
In-Reply-To: <CAL_JsqJmciSKp4H2KXcqv78Vga5gDi0JU_PY4Dth7LJrq6swMA@mail.gmail.com>
References: <20240430172520.535179-1-robh@kernel.org>
	 <4f3ce3439e3d996471085e906902e508528308d3.camel@codeconstruct.com.au>
	 <CAL_JsqJmciSKp4H2KXcqv78Vga5gDi0JU_PY4Dth7LJrq6swMA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2024-05-01 at 07:39 -0500, Rob Herring wrote:
> On Tue, Apr 30, 2024 at 7:40=E2=80=AFPM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > On Tue, 2024-04-30 at 12:25 -0500, Rob Herring (Arm) wrote:
> > > The use of 'oneOf' to include 1 of 3 possible child node schemas resu=
lts
> > > in error messages containing the actual error message(s) for the corr=
ect
> > > SoC buried in the tons of error messages from the 2 schemas that don'=
t
> > > apply. It also causes the pinctrl schema to be applied twice as it wi=
ll
> > > be applied when the compatible matches.
> > >=20
> > > All that's really needed in the parent schema is to ensure one of the
> > > possible compatible strings is present in the pinctrl node so that it=
s
> > > schema will be applied separately.
> >=20
> > Thanks, I think it improves the readability of intent in the binding as
> > well.
> >=20
> > To understand the impact better I grabbed the patch and diffed the
> > output of `make CHECK_DTBS=3Dy aspeed/aspeed-ast2600-evb.dtb` before an=
d
> > after applying it, but there was no significant difference in output.
> > Should that not demonstrate the errors being cleaned up? If not, what
> > should?
>=20
> Try it on one of the new boards posted in the last 1-2 days. It showed
> up on my testing dtbs_check on patches. I didn't send a report because
> there was so much noise in it.

I tried with aspeed/aspeed-bmc-ibm-blueridge.dtb and yeah, it does
clean up a lot of barf. Nice. Thanks.

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

[1]: https://lore.kernel.org/lkml/20240429210131.373487-14-eajames@linux.ib=
m.com/
