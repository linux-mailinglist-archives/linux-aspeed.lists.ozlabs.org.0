Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8E973828D
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Jun 2023 14:02:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=F/KGFrLg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmMZT5MQcz30NP
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Jun 2023 22:02:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=F/KGFrLg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=yulei.sh@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmMZH1dsBz2y1b
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Jun 2023 22:02:30 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-54fba092ef5so4635629a12.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Jun 2023 05:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1687348945; x=1689940945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhxmnBwA3kxFM1Khy1EXv4uS5Bs0rCsQz59EI6x6O38=;
        b=F/KGFrLg4zD/PMnwpqt+njNXxH5Rs94zpA07R9mKFtHQJG79P/UwYxEP8E448E4kod
         ujgEISipQqVYQb/8UsU6WJSKzTgNY7IwsGo74ryReNAfPQdJtk1h3p03MMhuITs7K+r4
         BXe7y7d2dah3gGHL8Gmm6qIDGh1FTuKO949HM6XX/LnCXScv8WkiSTqzXQyh0OlDD3wj
         FyBoXTUCKetNKgrv+dzwTspwpCeaXxHZkIBAwbY4inwnq2Ehx/BIFthlPeXFjyULT2Lb
         nBosdkgEGXJ/huQqsRElA5XBTBhZ1JsMAgYVDYFmRfk26YAtp7qD0IsFdGm4dhGvO9qB
         m4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687348945; x=1689940945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MhxmnBwA3kxFM1Khy1EXv4uS5Bs0rCsQz59EI6x6O38=;
        b=M0G9Vru7qE2lJORR/vPrcAXWGFkWyR6k1n3UvfvEsODaIm++oxqimthcKkMcfaNSZB
         zAFAKUQbnQXC+bDF4iLIuJ09dTskXmJzVZtkuVULCgzHjRIPGWba6UnTRRfMmw+PV2b4
         TIBACzAdMUgAWNZCGsxO+cMCfdRFu6gNg2VlhejAJmHQbsdvwmZvFYljn7gku5bGb/fC
         g/A736ytFI0fMoM+zN/Pod4P/gvUG5l6fsDSSUTTZGHuXxFQvDzy1jnTzfyR9X3xHbse
         T5S1VqyKaHYRLIWOVze1EInlNbX2C9QXljgk3HymxRIJhelan4bNGTULqdSA/rGQ/3F2
         jBNg==
X-Gm-Message-State: AC+VfDzMiInWXyHwweatKN6i7OKSUJkGQV7DpAcNePHE8dRLE35+gSpy
	u4HDjM5cxj41tlOiyAQS5EdJ3GLDeke2kjaPtqtUtw==
X-Google-Smtp-Source: ACHHUZ5zFAeEYC/BiDisvvqJBTZap8sir1tOWv1nt/yk/At8UfskkIcU6yoJqTMS0MMTY6rXaqm3/YermK4VVVfrFds=
X-Received: by 2002:a17:90a:43e4:b0:25b:dc4b:611d with SMTP id
 r91-20020a17090a43e400b0025bdc4b611dmr15221652pjg.26.1687348945091; Wed, 21
 Jun 2023 05:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221024094853.2877441-1-yulei.sh@bytedance.com>
 <HK0PR06MB32022348EA65805C7109B7D080329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <CAGm54UExHOBw61DJNqxvW67OSr60fQ+Q247t63RzymiMOmHmFg@mail.gmail.com>
 <HK0PR06MB320203EF8E3AD14C34359B0580329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <Y1ueEYJk2epT/g4J@kroah.com> <HK0PR06MB32024F58191E17DC5ABC99F380329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <Y1uyssu84kl1INSR@kroah.com> <CAGm54UGmp=kTKGLhEfENF4SqkvRt_GcpuGH_g5PjtQiBkwtOsA@mail.gmail.com>
 <TY2PR06MB321303972156248AB08CAB2480EB9@TY2PR06MB3213.apcprd06.prod.outlook.com>
 <CAGm54UHWhRQsvaBQM7mgfP2A5os=mYDTfKS9qfS0C5_9XkcrSA@mail.gmail.com>
In-Reply-To: <CAGm54UHWhRQsvaBQM7mgfP2A5os=mYDTfKS9qfS0C5_9XkcrSA@mail.gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 21 Jun 2023 20:02:14 +0800
Message-ID: <CAGm54UG2uD2jruRc33Xm4izepYpuFNBBcGe594as8_fx1uEWQg@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: aspeed: fix buffer overflow
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Felipe Balbi <balbi@kernel.org>, Henry Tian <tianxiaofeng@bytedance.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Neal Liu <neal_liu@aspeedtech.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jakob Koschel <jakobkoschel@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Dec 21, 2022 at 10:26=E2=80=AFAM Lei Yu <yulei.sh@bytedance.com> wr=
ote:
>
> On Wed, Dec 21, 2022 at 10:17 AM Neal Liu <neal_liu@aspeedtech.com> wrote=
:
> > > > > > > Using rndis is able to set MTU to 2000, and the issue can be
> > > reproduced.
> > >
> > > USB ecm is also tested and it is possible to set MTU to 2000, and cou=
ld
> > > reproduce the issue.
> > > So I think this patch is needed anyway.
> > >
> > > @Neal Liu Could you kindly help to verify the USB ECM case?
> >
> > How to set MTU to 2000 on USB ECM case? I remember last time I cannot s=
et by using "ifconfig ..."
> > Regardless ECM or RNDIS, I agree this patch is still needed.
>
> You were able to set MTU to 2000 for RNDIS but not for NCM.
> @Greg Kroah-Hartman indicated that RNDIS should not be used anymore.
> So I tested ECM and verified it could set MTU 2000 and the issue could
> be reproduced.

This patch fixes the kernel oops in the aspeed-vhub driver for both
USB ECM and RNDIS.
It now has an Acked-by from benh and Reviewed-by from neal_liu

Should we merge this patch?
