Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1ABD36C7
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 03:17:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q96Y192wzDqCc
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 12:17:25 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=netronome.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=jakub.kicinski@netronome.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=netronome-com.20150623.gappssmtp.com
 header.i=@netronome-com.20150623.gappssmtp.com header.b="P1TDOu+h"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q96J31b7zDqTC
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2019 12:17:12 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id t20so6221790qtr.10
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Oct 2019 18:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=FRAhjU6zbOujsKrU9OXTc20iXWxJB1PbXELLM5EnWz4=;
 b=P1TDOu+hLEOcYZdp+RsC60/WrDZp/0xsV3XEPvMb+X1f2sb8KVh050ChS/DzqZuxu8
 LfIixQWkK/AwqxVuEVLOrPZjVGRc6zmnjWRM9aUwlWSTj5xkRz8xU7p99/Qvaynfepcf
 uvsihaoCaRpQWHf2MCAo0RG7xtTRnRD4nq3OsDCv6m3Xy6UY6F/0Q2e3xamg9fFlx88B
 dTEcIY4+AwFNN/rzgizAzI9XEoUwBaH7h3NhapVmfuzZWvdafnrP4nD9jdNIC6FczlsH
 zed2XaA9tN0P9Q3eDjBeau2NNwysV8CtKdbCM2i44OAO7zFoclfCovDLWkJ6fTixQURX
 5EjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=FRAhjU6zbOujsKrU9OXTc20iXWxJB1PbXELLM5EnWz4=;
 b=D0ZMfRRStGodVF9CC5ydY5Ckh5+U41iS9mSFcUPM7/2WrNwXcaSy0bWzM9BDV/b6IV
 JZuks7m81WGnwDyM9vlqHWjmXFw/bQdwk0TW3CwNHVTcAu+LkxMUgVgxlw/DoKGmP44f
 b2ldS3XvCfZWpdrKFrypLwTa3zBAv6SQSeZRfrxRdgOY9gmpSpvYzE8wLBEGtchmfbmH
 NgONuzswjGgzaNRMwVn3SavJtrX3U+0ZeFPmgaBApMIvlvmNBAeHScBlon+5VI8UyB2N
 iD0jVB5MTMAevqZcdm1XfGdUuzMKG+cCnimawia10A2D9Wzm5Z0/RGvJU7V5Ps9Kp5E4
 /68g==
X-Gm-Message-State: APjAAAVXvFLdhfbTlHZKoUp5iNHBppXf8aFouCmpBDllJob67HYzTir9
 U0wdVbBfWKOw7uigffAHcw+GjA==
X-Google-Smtp-Source: APXvYqzOjSHMUU98eUi/w1xmBfaHzCT2guSL+N5oE5fPyX4+S+M5Qlk63IT5XbmdeS8oaoRfnXpgbA==
X-Received: by 2002:ac8:7557:: with SMTP id b23mr14086447qtr.384.1570756628331; 
 Thu, 10 Oct 2019 18:17:08 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id a190sm3908987qkf.118.2019.10.10.18.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:17:08 -0700 (PDT)
Date: Thu, 10 Oct 2019 18:16:51 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH v2] ftgmac100: Disable HW checksum generation on AST2500
Message-ID: <20191010181651.5abd4c21@cakuba.netronome.com>
In-Reply-To: <4B7340B5-C35C-4B18-8D8C-B5B8D16BA551@fb.com>
References: <20190911194453.2595021-1-vijaykhemka@fb.com>
 <4B7340B5-C35C-4B18-8D8C-B5B8D16BA551@fb.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Sai Dasari <sdasari@fb.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 YueHaibing <yuehaibing@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Mauro
 Carvalho Chehab <mchehab+samsung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "David S. Miller" <davem@davemloft.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 10 Oct 2019 19:20:47 +0000, Vijay Khemka wrote:
> Resending this patch again.=20

Perhaps I'm missing context but what's the intention here?

In case this is resubmitting the patch for inclusion in the upstream
kernel you need to send it out properly with git send-email or such..

> =EF=BB=BFOn 9/11/19, 1:05 PM, "Vijay Khemka" <vijaykhemka@fb.com> wrote:
>=20
>     HW checksum generation is not working for AST2500, specially with IPV6
>     over NCSI. All TCP packets with IPv6 get dropped. By disabling this
>     it works perfectly fine with IPV6. As it works for IPV4 so enabled
>     hw checksum back for IPV4.
>    =20
>     Verified with IPV6 enabled and can do ssh.
>    =20
>     Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
