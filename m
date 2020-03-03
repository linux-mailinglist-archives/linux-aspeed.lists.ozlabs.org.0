Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1297A17880B
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Mar 2020 03:06:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XHLD4JyszDqNs
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Mar 2020 13:06:28 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=gXPMEWnO; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WpFZ6XvCzDqBg
 for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Mar 2020 18:15:46 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id e20so2074065qto.5
 for <linux-aspeed@lists.ozlabs.org>; Mon, 02 Mar 2020 23:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ypYkPGQ+tuqNht2BOkSbdXQNq89bA72Qai2EXZj0f5o=;
 b=gXPMEWnOC5Cy3ZPGY+FzhF5FeyaaKpTZhjCaytHjaH7R5bIJ+NeoX29usAxajcmFWD
 0osf+xGKl8I1Rk25X70aOLLAx066ylCSu2IiUw76f42PjizbAasiLLQU6eaWVZ08Ecla
 Nphech8ot3kQYbTOsW3KbZ+gn5bvdm8A5nHQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ypYkPGQ+tuqNht2BOkSbdXQNq89bA72Qai2EXZj0f5o=;
 b=inrmDk5EdL6WdZXAFiOCmq3pNc/NaoiGQsoLSV12Mxpsc4FozZn0QcUjh96LklHMDc
 WnohCSqMfpXzDhE2jIIGSJu+WCP9B9YVO2GsZsYPpYpLF1tKP9RtjFB5EicCirIpnc28
 9FRyCXkd4zQlywarqZFcobHYSq2YWUjTGr17t+6/2gPP+9yMgxH7H1e6WMAeG/PD102k
 0czwmR7sJYnnam/COUl0zVW44NpXKGV9VnEzhATA896tBNgsy+NMr3W9NhXi2V9gRdLJ
 mgcv/qyBQ5rvGx0ZE0YPaRqOKJATOLC4J09oknt29QJtHIt8pPOvbs27EUed4XZQ7ZLk
 fUFg==
X-Gm-Message-State: ANhLgQ0XIM1X24QHpB3uSgrjzbkTF0vskZDJVf0EBqj5sZKEYCE6x+QE
 viF9DSD1l9RYZtlRdEwkhq1IfPHZo3BZdcRH2a8=
X-Google-Smtp-Source: ADFU+vvpPdIPrOMla3lHMKsvtgOsYhvOly+EDWJuxYHMS9CAj7ketuc9MhtRLZmEt1grmksChe08v/qQPfdfCEzGbUE=
X-Received: by 2002:aed:3841:: with SMTP id j59mr3274883qte.220.1583219742473; 
 Mon, 02 Mar 2020 23:15:42 -0800 (PST)
MIME-Version: 1.0
References: <20200302180730.1886678-1-tudor.ambarus@microchip.com>
In-Reply-To: <20200302180730.1886678-1-tudor.ambarus@microchip.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 3 Mar 2020 07:15:31 +0000
Message-ID: <CACPK8Xcvf2wSE5Y4E8Lbs6R9mHhztvNsr8vNrYaPX+kMMUhZvA@mail.gmail.com>
Subject: Re: [PATCH 00/23] mtd: spi-nor: Move manufacturer/SFDP code out of
 the core
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 04 Mar 2020 12:56:20 +1100
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, thor.thayer@linux.intel.com,
 jethro@fortanix.com, rfontana@redhat.com,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, opensource@jilayne.com,
 Richard Weinberger <richard@nod.at>, Michal Simek <michal.simek@xilinx.com>,
 Ludovic.Desroches@microchip.com, allison@lohutok.net, nishkadg.linux@gmail.com,
 john.garry@huawei.com, Vladimir Zapolskiy <vz@mleia.com>,
 alexander.sverdlin@nokia.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <swboyd@chromium.org>,
 mika.westerberg@linux.intel.com, ludovic.barre@st.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <Nicolas.Ferre@microchip.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dinguyen@kernel.org,
 Michael Walle <michael@walle.cc>, linux-mediatek@lists.infradead.org,
 info@metux.net
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Tudor,

On Mon, 2 Mar 2020 at 18:07, <Tudor.Ambarus@microchip.com> wrote:
>
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
>
> Hello,
>
> This patch series is an attempt at getting all manufacturer specific
> quirks/code out of the core to make the core logic more readable and
> thus ease maintainance.

I tried to apply this to linus' tree (5.6-rc4) but it had a bunch of
conflicts. What did you base this on?
