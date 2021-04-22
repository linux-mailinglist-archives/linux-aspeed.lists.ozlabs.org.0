Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B2F3684BB
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Apr 2021 18:23:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FR2lZ6sypz2yxm
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Apr 2021 02:23:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.85.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 75 seconds by postgrey-1.36 at boromir;
 Fri, 23 Apr 2021 02:23:04 AEST
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FR2lX2p8Sz2xgF
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Apr 2021 02:23:04 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-270-mhKvP-dDOsuLyQ0QyQj3_Q-1; Thu, 22 Apr 2021 17:21:41 +0100
X-MC-Unique: mhKvP-dDOsuLyQ0QyQj3_Q-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 17:21:40 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Thu, 22 Apr 2021 17:21:40 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Dan Carpenter' <dan.carpenter@oracle.com>, Joel Stanley <joel@jms.id.au>
Subject: RE: [PATCH] soc: aspeed: fix a ternary sign expansion bug
Thread-Topic: [PATCH] soc: aspeed: fix a ternary sign expansion bug
Thread-Index: AQHXN1ec+IlNNgnl7EGootyN/jCOrarAtu4w
Date: Thu, 22 Apr 2021 16:21:40 +0000
Message-ID: <59596244622c4a15ac8cc0747332d0be@AcuMS.aculab.com>
References: <YIE90PSXsMTa2Y8n@mwanda>
In-Reply-To: <YIE90PSXsMTa2Y8n@mwanda>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: Robert Lippert <rlippert@google.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Patrick Venture <venture@google.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Dan Carpenter
> Sent: 22 April 2021 10:12
>=20
> The intent here was to return negative error codes but it actually
> returns positive values.  The problem is that type promotion with
> ternary operations is quite complicated.
>=20
> "ret" is an int.  "copied" is a u32.  And the snoop_file_read() function
> returns long.  What happens is that "ret" is cast to u32 and becomes
> positive then it's cast to long and it's still positive.
>=20
> Fix this by removing the ternary so that "ret" is type promoted directly
> to long.
>=20
> Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc ch=
ardev")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/a=
speed-lpc-snoop.c
> index 210455efb321..eceeaf8dfbeb 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -94,8 +94,10 @@ static ssize_t snoop_file_read(struct file *file, char=
 __user *buffer,
>  =09=09=09return -EINTR;
>  =09}
>  =09ret =3D kfifo_to_user(&chan->fifo, buffer, count, &copied);
> +=09if (ret)
> +=09=09return ret;
>=20
> -=09return ret ? ret : copied;
> +=09return copied;

I wonder if changing it to:
=09return ret ? ret + 0L : copied;

Might make people think in the future and not convert it back
as an 'optimisation'.

I much prefer adding 0 to a cast to fix integer types.
In can go less wrong!

IMHO there are far too many casts in the kernel sources.
Especially the ones that are only there to appease sparse.
A functional notation for those would remove some of
the potential problems.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

