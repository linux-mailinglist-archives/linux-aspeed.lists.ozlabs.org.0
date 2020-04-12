Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E0D1A611A
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Apr 2020 01:23:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 490nqb566vzDqVc
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Apr 2020 09:23:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=LqUYmCHg; dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 490nqR2mgPzDqT3
 for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Apr 2020 09:23:06 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id h25so7101900lja.10
 for <linux-aspeed@lists.ozlabs.org>; Sun, 12 Apr 2020 16:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=vRy3u5hGj6gsjmfHFHp/lfY/8fOsIf5hzgs76KPdL0o=;
 b=LqUYmCHgQIbWSq7OZsvA+KEVUdagsmAg2vt1OcEXADuwAMTftEhA7lsaY0/Sdkd9iu
 TAF6UT/CdLa9NjzSwtKM67a9Y2iIn3k1Qn5wIjkY+xW1IKo4gkvtcUYQjzUQan8611qp
 cr40rUZo1cg9A8dnFOmxU6ljzxaPB2XQ71N+hLCIxOFj4bfwgrmd71w1sTevRn5uDdiM
 lrlmJclhPYCgZvz0cavHVm0Bz28YQuQl6hpcI/yD88ZkwbxfDkXLiH4cVmdg3j5BtXZs
 2bM/1BGjipBJFNRPb/QROEGm19vIw1iKcs89h0vN1SdPhoFRMjP9XSfnDP186D4W1ErA
 BB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=vRy3u5hGj6gsjmfHFHp/lfY/8fOsIf5hzgs76KPdL0o=;
 b=gyXxhQg97VXmSw9XAjlFIGxAdQC2agx0FsYyVx744+AHghF7/2/H4CEeL1wxenugc4
 oIuTInvecmXmBR1UogeupnArYhZNtfoHqaE2WPEKrGTUFLcxTxzVRyUc02+aGt0Y1rHM
 KzADbiixt9mly1EdOhplecJZaJPjkbn9OoZSC3DcCOzOhiVcCmFnFg8o8iwWv2V/y/nS
 IJtJy3omLvCzP5t5+ndxIBz8UVpnKlzGfpk+XtWUZkOJH8pNHZxN5lYQig6vgY1SBkDV
 mkCtYO/Y2QBM6PnYFthwlLWBZ2m+SOY0IfqaKmwYktQrlm03GeIaLcaLxe4WjL8P6J8d
 Kr5A==
X-Gm-Message-State: AGi0PuaTzUdCiRN8M+uM9KatSbbTyKoyu45u/7IlSa2+uIHHXynlqesi
 AvMeH0vTWO3MrHP0S6s7je1eYztKPavbxxD82jB/PwshgkO/uA==
X-Google-Smtp-Source: APiQypJHaW9iTBPH0W2tLAwkeN5nr6YWNQeDGLsq2AIz+KH72IFsXVT2EdlhtQrDUtG+v9gE1rMTkwcTXkZJYi8TIN8=
X-Received: by 2002:a2e:7211:: with SMTP id n17mr908356ljc.273.1586733781738; 
 Sun, 12 Apr 2020 16:23:01 -0700 (PDT)
MIME-Version: 1.0
From: Oskar Senft <osk@google.com>
Date: Sun, 12 Apr 2020 19:22:45 -0400
Message-ID: <CABoTLcTN4PnifNTeLp71cnT5Ej_+zVB7yfAPDnPXkGHA0OiUKA@mail.gmail.com>
Subject: AST2600 clock gates
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: multipart/alternative; boundary="0000000000006a5c7705a3203fb4"
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--0000000000006a5c7705a3203fb4
Content-Type: text/plain; charset="UTF-8"

Hey Joel and Andrew

I'm working on the AST2600 EVB trying to get some eSPI functionality to
work using
https://github.com/AspeedTech-BMC/linux/blob/aspeed-dev-v5.1/drivers/soc/aspeed/aspeed-espi.c.
The driver is missing support for clock enablement so I dug into how this
could be added.

I noticed that you guys worked on include/dt-bindings/clock/ast2600-clock.h
but from what I can tell the ASPEED_CLK_GATE_* definitions have not yet
been updated from AST2500 to AST2600.

Am I looking at the latest version of the file? I'm happy to update the
clock gate bits, but I don't want to duplicate work that you have in the
pipeline.

Thanks
Oskar.

--0000000000006a5c7705a3203fb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey Joel and Andrew<div><br></div><div>I&#39;m working on =
the AST2600 EVB trying to get some eSPI functionality to work using=C2=A0<a=
 href=3D"https://github.com/AspeedTech-BMC/linux/blob/aspeed-dev-v5.1/drive=
rs/soc/aspeed/aspeed-espi.c">https://github.com/AspeedTech-BMC/linux/blob/a=
speed-dev-v5.1/drivers/soc/aspeed/aspeed-espi.c</a>. The driver is missing =
support for clock enablement so I dug into how this could be added.</div><d=
iv><br></div><div>I noticed that you guys worked on=C2=A0include/dt-binding=
s/clock/ast2600-clock.h but from what I can tell the ASPEED_CLK_GATE_* defi=
nitions have not yet been updated from AST2500 to AST2600.</div><div><br></=
div><div>Am I looking at the latest version of the file? I&#39;m happy to u=
pdate the clock gate bits, but I don&#39;t want to duplicate work that you =
have in the pipeline.</div><div><br></div><div>Thanks</div><div>Oskar.</div=
></div>

--0000000000006a5c7705a3203fb4--
