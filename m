Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EEB2FA3E1
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Jan 2021 15:59:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKFLy1pl2zDqh2
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jan 2021 01:59:54 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::632;
 helo=mail-ej1-x632.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WimftGn8; dkim-atps=neutral
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKFLf3rsGzDqgs
 for <linux-aspeed@lists.ozlabs.org>; Tue, 19 Jan 2021 01:59:34 +1100 (AEDT)
Received: by mail-ej1-x632.google.com with SMTP id gx5so4856402ejb.7
 for <linux-aspeed@lists.ozlabs.org>; Mon, 18 Jan 2021 06:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iSBE4jHyV0yiGAPlv7yUlmbeiPPVBYbZTBnxyeVqKhc=;
 b=WimftGn8DrHzzSkaIaeyHp4Rf5wrkFzQejolh5k7FrvTM1X4tQJfL6BPb0pntGz5jU
 rtis3d7qLkXwTnZ5Tx904Tmlx9JxRGOiLxQfHo9Xwf3G6ebDePuOuAbmEudqlWIgpKH3
 wAaDjsOriul24e2cFyWZJa1xIFzJ5Tu2vWnjXgx8gqcU3GlCpQ3CwbO6ka7jUCCoTj9S
 naNB+8tAa2C/krD+3BFO+Ri5/sPlH+nxGyXWmMo9A1D6Sj8LFoMEmXyp76OSZkPloVe8
 ZVRWa+2RG6siOwJdiU3Qh9JpKK2Mx30aqtBYekBA70fIzUkvnuudh6Vdtw5WNHXS8Nxv
 ETJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iSBE4jHyV0yiGAPlv7yUlmbeiPPVBYbZTBnxyeVqKhc=;
 b=jILrDQPV3XZzgR/IrCgKqW7mXrB8I+5eVy+X6YYYuyjWXfAieYPR+59Ixf9eIxzDnr
 JfntCOtxLrx9MypDAe/ODBTgxg0+PfQt94o8aRlWQhkENdJQX9urP+73oFxN0zn/IWd/
 80IL+ACQvvb6JlPex5wqJBZpj5hK2breGbap7ZDDCUU2vIq6J+/j5BRuGlczq5ABquUe
 PCzq3EdQOfB5BmuNAfCH5CTicyjfXND23kjRkGhKT+wKsuRCrc/vD2mf9agNv5q9vsL8
 PbUG5MOeBbcMLdTUAmtDsXfyhzI5px2gH2CsUFbYeosG60NZe46tWT2+EVIbUNbKGvQK
 XOBw==
X-Gm-Message-State: AOAM531B7XEISMSedn3pp+g8FgVC6g5aUC7BGmWxxgLKM3lXPi1f//6k
 ZXIr1kvPVBvrfjlf+rvni+MrwkRb2I8qhJnIIJtpiA==
X-Google-Smtp-Source: ABdhPJwI73VNVTnVNFqoeKDEdVqoH328eZPX4L/8TfI3OnSMbLTmqOtJyvigmGCGUUyH0NQs8m/gMD5eGsq/Db7OWWY=
X-Received: by 2002:a17:906:388b:: with SMTP id
 q11mr46695ejd.421.1610981968099; 
 Mon, 18 Jan 2021 06:59:28 -0800 (PST)
MIME-Version: 1.0
References: <20210114131622.8951-1-chiawei_wang@aspeedtech.com>
 <20210114131622.8951-5-chiawei_wang@aspeedtech.com>
In-Reply-To: <20210114131622.8951-5-chiawei_wang@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Jan 2021 15:59:16 +0100
Message-ID: <CACRpkdbqJuKHH+sR3LfWV72kM7TEhimFVi1viuQGkP8DWOODow@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] pinctrl: aspeed-g5: Adapt to new LPC device tree
 layout
To: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, haiyue.wang@linux.intel.com,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Corey Minyard <minyard@acm.org>,
 BMC-SW@aspeedtech.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Robert Lippert <rlippert@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, cyrilbur@gmail.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jan 14, 2021 at 2:17 PM Chia-Wei, Wang
<chiawei_wang@aspeedtech.com> wrote:

> Add check against LPC device v2 compatible string to
> ensure that the fixed device tree layout is adopted.
> The LPC register offsets are also fixed accordingly.
>
> Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I suppose the patches need to go in together. Tell me if you
need me to apply this one patch to the pinctrl tree.

Yours,
Linus Walleij
