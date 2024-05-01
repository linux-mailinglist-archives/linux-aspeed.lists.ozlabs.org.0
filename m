Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFC38B8A26
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 May 2024 14:40:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BU2zS/pz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTxVQ6fYpz3cRt
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 May 2024 22:40:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BU2zS/pz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTxVG5hcvz30hQ
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 May 2024 22:40:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9C3F4CE12CF
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 May 2024 12:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE28BC4AF18
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 May 2024 12:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714567202;
	bh=cl0dB5wGo+5uj0Y4IQNMQknyPfpkK+3SgXwRRuMM5EM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BU2zS/pz6catu1evdEGNz+5JPjugv/TZDFsNqElqDT3eLgxQl+AsZk7j6Z0xQ9j/w
	 l7QxAWnwHalymxPBytEy0dobttdhXqel1zgQFKWN+/OFmBgLcp+MXJejeT07AKZi2O
	 Lh9x4qsaZcz0wadMswTjmrWZMGJUmWt6mEj6ADUUg2+O1tjtDoxd/Cp5IB4+TyF1gF
	 vG7sUo0cqt43SLkUt/tZ0V6fjvR59/TJjgEEyacouyj7vSU9mYjoXaxTy0fjkozTQs
	 mMngeWklfzhGcCKnEVl9pqO87GwnouiHOBLGTLizxjMXxmLQiz302iLFBtu5DRuGSN
	 0I+iP5hWJJysQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516d68d7a8bso705995e87.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 01 May 2024 05:40:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHA28m9LPd0aOegsJf9M8KMCRxOlYJfksjULYK1udgeJD//xGxHmclWU9Aiy/D1UVkVjWDehXLh/LiqJkmaBCEsBHJjSg+vTA5ZsIZCw==
X-Gm-Message-State: AOJu0Yxi65dZSP/jaybM65h9+ixWDcb+Vt1uVE+ga4gVtDZ2VDLy2vCE
	Iqt069BqNggpfDzLWBqSEeZjf78KKfMyNTL9h2LlvsgKxs9LM5KP+LiJqoy0bSmrH6dA+qU1DiW
	hOCFMZSVlSTDVdjTJiBe05NIvTQ==
X-Google-Smtp-Source: AGHT+IHfnLb4uX/CU49Wr6YrEIPeVaOTobqSBnrzfgvUOpXZjqc+PjMD1HIeOKWFvDKbqLBLBRoBOD0nP82bn0JE5fo=
X-Received: by 2002:ac2:42cf:0:b0:51c:4e0f:ba33 with SMTP id
 n15-20020ac242cf000000b0051c4e0fba33mr758683lfl.18.1714567201151; Wed, 01 May
 2024 05:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240430172520.535179-1-robh@kernel.org> <4f3ce3439e3d996471085e906902e508528308d3.camel@codeconstruct.com.au>
In-Reply-To: <4f3ce3439e3d996471085e906902e508528308d3.camel@codeconstruct.com.au>
From: Rob Herring <robh@kernel.org>
Date: Wed, 1 May 2024 07:39:48 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJmciSKp4H2KXcqv78Vga5gDi0JU_PY4Dth7LJrq6swMA@mail.gmail.com>
Message-ID: <CAL_JsqJmciSKp4H2KXcqv78Vga5gDi0JU_PY4Dth7LJrq6swMA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: aspeed: Drop 'oneOf' for pinctrl node
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Apr 30, 2024 at 7:40=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Tue, 2024-04-30 at 12:25 -0500, Rob Herring (Arm) wrote:
> > The use of 'oneOf' to include 1 of 3 possible child node schemas result=
s
> > in error messages containing the actual error message(s) for the correc=
t
> > SoC buried in the tons of error messages from the 2 schemas that don't
> > apply. It also causes the pinctrl schema to be applied twice as it will
> > be applied when the compatible matches.
> >
> > All that's really needed in the parent schema is to ensure one of the
> > possible compatible strings is present in the pinctrl node so that its
> > schema will be applied separately.
>
> Thanks, I think it improves the readability of intent in the binding as
> well.
>
> To understand the impact better I grabbed the patch and diffed the
> output of `make CHECK_DTBS=3Dy aspeed/aspeed-ast2600-evb.dtb` before and
> after applying it, but there was no significant difference in output.
> Should that not demonstrate the errors being cleaned up? If not, what
> should?

Try it on one of the new boards posted in the last 1-2 days. It showed
up on my testing dtbs_check on patches. I didn't send a report because
there was so much noise in it.

Rob
