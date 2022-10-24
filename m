Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAA160BD11
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Oct 2022 00:06:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mx8Kb3KX7z3bsK
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Oct 2022 09:06:11 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mx8KR5yTZz2yQl
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Oct 2022 09:06:02 +1100 (AEDT)
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 29OLxHwv016050;
	Mon, 24 Oct 2022 16:59:18 -0500
Message-ID: <661b43881b7f8764919847f29c0daf1866441090.camel@kernel.crashing.org>
Subject: Re: [PATCH] usb: gadget: aspeed: fix buffer overflow
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Lei YU <yulei.sh@bytedance.com>, Felipe Balbi <balbi@kernel.org>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Henry Tian <tianxiaofeng@bytedance.com>,
        Jakob Koschel <jakobkoschel@gmail.com>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Date: Tue, 25 Oct 2022 08:59:17 +1100
In-Reply-To: <20221024094853.2877441-1-yulei.sh@bytedance.com>
References: <20221024094853.2877441-1-yulei.sh@bytedance.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 2022-10-24 at 09:48 +0000, Lei YU wrote:
> From: Henry Tian <tianxiaofeng@bytedance.com>

I wrote that driver, please CC me on further patches to it (thanks Joel
for the heads up).

> In ast_vhub_epn_handle_ack() when the received data length exceeds the
> buffer, it does not check the case and just copies to req.buf and cause
> a buffer overflow, kernel oops on this case.

 .../...

Thanks ! Seems like a legit bug, however:

> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/epn.c b/drivers/usb/gadge=
t/udc/aspeed-vhub/epn.c
> index b5252880b389..56e55472daa1 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> @@ -84,6 +84,7 @@ static void ast_vhub_epn_handle_ack(struct ast_vhub_ep =
*ep)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct ast_vhub_req *req;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int len;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int status =3D 0;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 stat;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Read EP status */
> @@ -119,9 +120,15 @@ static void ast_vhub_epn_handle_ack(struct ast_vhub_=
ep *ep)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0len =3D VHUB_EP_DMA_TX_SI=
ZE(stat);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* If not using DMA, copy=
 data out if needed */
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!req->req.dma && !ep->epn.=
is_in && len)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0memcpy(req->req.buf + req->req.actual, ep->buf, len);
> -
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!req->req.dma && !ep->epn.=
is_in && len) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0if (req->req.actual + len > req->req.length) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0req->last=
_desc =3D 1;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =
=3D -EOVERFLOW;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto done=
;

Should we stall as well ? Should we continue receiving and just dropping th=
e data until we have
a small packet ? Otherwise the EP could get out of sync for subsequent ones=
...

Additionally, I'm curious, why in this specific case is the device sending =
more data than
the buffer can hold ? The MTU change should have resulted in buffers being =
re-allocated no ?
Or did you change the MTU on the remote and not on the local device ?

Cheers,
Ben.
