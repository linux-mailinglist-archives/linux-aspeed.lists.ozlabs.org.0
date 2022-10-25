Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AC260D735
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Oct 2022 00:36:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mxmxm3HKSz3bym
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Oct 2022 09:36:12 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mxmxd68xtz2xgG
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Oct 2022 09:36:04 +1100 (AEDT)
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 29PMTNiP006450;
	Tue, 25 Oct 2022 17:29:24 -0500
Message-ID: <49d97f97e63edb70392279845186547d73b2290e.camel@kernel.crashing.org>
Subject: Re: [PATCH] usb: gadget: aspeed: fix buffer overflow
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 26 Oct 2022 09:29:23 +1100
In-Reply-To: <CAGm54UE1oS1N_hn4RKuF8a+OWgfvJ-OCc0-uju4mXbtz-jw8VA@mail.gmail.com>
References: <20221024094853.2877441-1-yulei.sh@bytedance.com>
	 <661b43881b7f8764919847f29c0daf1866441090.camel@kernel.crashing.org>
	 <CAGm54UE1oS1N_hn4RKuF8a+OWgfvJ-OCc0-uju4mXbtz-jw8VA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
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
Cc: Felipe Balbi <balbi@kernel.org>, Henry Tian <tianxiaofeng@bytedance.com>, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Jakob Koschel <jakobkoschel@gmail.com>, "moderated
 list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2022-10-25 at 14:21 +0800, Lei Yu wrote:
>=20

> This case is treated as an error and we do not care about the
> following data.
> Similarly, if we change the MTU in BMC and let BMC ping the OS, the
> OS
> kernel does not crash and it gets RX errors, and the ping fails.
>=20
> =C2=A0# ifconfig usb0
> =C2=A0usb0: flags=3D4163<UP,BROADCAST,RUNNING,MULTICAST>=C2=A0 mtu 1500
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RX packets 85=C2=A0 byte=
s 15380 (15.0 KiB)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RX errors 51=C2=A0 dropp=
ed 0=C2=A0 overruns 0=C2=A0 frame 51
>=20
> With this patch, we get the similar behavior on BMC that the RX
> errors
> are increasing.
>=20
> > Additionally, I'm curious, why in this specific case is the device
> > sending more data than
> > the buffer can hold ? The MTU change should have resulted in
> > buffers being re-allocated no ?
>=20
> The issue is found in a rare case during BIOS boot, we assume that
> BIOS is sending unexpected data to BMC for unknown reasons.

Ok thanks.

Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>


> > Or did you change the MTU on the remote and not on the local device
> > ?
> >=20
>=20
> Yes, the MTU is changed to 2000 in OS and kept 1500 on BMC, then the
> issue is reproduced. (see detailed steps in the above email).
>=20
> The reason we made the above test is because we are trying to
> reproduce the behavior as BIOS, and from the logs it looks like it's
> sending a packet larger than MTU. Then we tried to adjust the MTU on
> the OS side and reproduced the issue.

