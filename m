Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 979AB453E7E
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 03:29:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv6Mf4C0Sz2yQB
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 13:29:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=HUBc2VsO;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=HUBc2VsO; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv6MZ1819z2xF1
 for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Nov 2021 13:29:46 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id b1so2778565lfs.13
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Nov 2021 18:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+P4IjzTwEv6mk85kC5++Ugnp6PKvNN2LJ2S6HPz5i9o=;
 b=HUBc2VsODAlGtdaPHTmjvlHbcyrjAfBT7543iEm7oMIj8F5cRooPwUq9a2eYygVMBY
 orSxWF3ZyCJuSK9PYlKR2Xfqpq2jNVACWcLA2CPC/PYC2y8b5LnlFEcR6UNAWeIWA2nR
 I53b2ZjNqAv3iqon5tWhABJHJGvGWI6EfttJUKvO/axbdkusj/ylSkFO7G6soMlh5rN4
 /HnIbp/50oV7eRdl2vLV39eGN+3/N0ozBQWQfEZKrrW3xXW2JHLFJqoeNHaUc7utRtWh
 OYI3O+iSTGuc6R4zI0x4xoo0AWrxNzt44ZTv8uqYIKGN8Tnc/3xRaieIz7SbaqvBp6pQ
 Tmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+P4IjzTwEv6mk85kC5++Ugnp6PKvNN2LJ2S6HPz5i9o=;
 b=Gmeg8H8b3Cqdh8Vc3m+gKhoX8h6sK+2td6T5uAOJCuEHpEY9tlmLhIISXGU/U8RgYU
 E5U5OsnCb5M3xFpBM0qLnCLEHX142HE7nkZgiBqMoiNLTJvIIoiiJz/jtIu4ySFE2gec
 IZJtCUP/J0Qc8cpmQr6huT7o+vs0g5Og6LyLHJrWe4TCpI6TADNNoMafIy6APub0iSH8
 WRI3yFTkdwRyxBIbnxmHcBIhkmwg0mQNKq6d7baaH2iuEAhf/1fbaX5dw/2pu28mQYcO
 s7fnarn2TPZDFiSJb2WXq3vgJsdbszZTUKUsp4dFASJtNg1VGjVv7ffKHDFTw3kacdKa
 3JMA==
X-Gm-Message-State: AOAM530v8v8ce0dZIloMsCZVv0XNz2p12j2A+CypshyKU2Z7eCMuzjxj
 GOvC4FKz0AcYI8THwiUuteybpQBb5cpRRbHHO1kGyw==
X-Google-Smtp-Source: ABdhPJzBv3gILNlWD0koYhZN4GjemBzXpw7eqQtj233I8W+P1EYYEr7z3rjN9k/gPf6+RgXC+kmyG/+BIhyuXFeY+EA=
X-Received: by 2002:a05:6512:15a6:: with SMTP id
 bp38mr11418850lfb.21.1637116182733; 
 Tue, 16 Nov 2021 18:29:42 -0800 (PST)
MIME-Version: 1.0
References: <CABoTLcR2bHQCgV+ooVGE5GJ5NOeK1irDgg0P-rfErA=xbit0vg@mail.gmail.com>
 <CACPK8Xc_B4T-xAcQ7sSqOuVLpwBw69mmj7=5T_opr2AqUs7ThQ@mail.gmail.com>
 <CABoTLcQP+kSD2zO2O-_U23Xmi1e1YrjqVDRy3sCviXJ5K9pruw@mail.gmail.com>
 <CACPK8Xed0JN9drM6Apz=k24K06KT-gnooBjWeu8MAwNjxUNh3g@mail.gmail.com>
In-Reply-To: <CACPK8Xed0JN9drM6Apz=k24K06KT-gnooBjWeu8MAwNjxUNh3g@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Tue, 16 Nov 2021 21:29:27 -0500
Message-ID: <CABoTLcT2pxEVKQ=wsoTZ4qs_yo79r3g3otO_OuEm+SuaffRt4A@mail.gmail.com>
Subject: Re: vga_pw sysfs file
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
 Ali El-Haj-Mahmoud <aaelhaj@google.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> > Absolutely. I assume this will just be a 1-liner. I have the system
> > setup and can test at any time.
>
> Here we go:
>
>  https://lore.kernel.org/all/20211117010145.297253-1-joel@jms.id.au/
Thank you! Works for me on a TYAN S7106.

> Thanks for the detailed bug report. Please reply to that mail with
> your tested-by once you've confirmed this works.
Done.

Oskar.
