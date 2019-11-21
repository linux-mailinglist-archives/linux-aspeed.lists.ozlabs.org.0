Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49969105010
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Nov 2019 11:09:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JZz43Jh1zDr5l
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Nov 2019 21:09:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=luc.vanoostenryck@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="prbs1dP8"; 
 dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JZyr318mzDr5b
 for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Nov 2019 21:08:52 +1100 (AEDT)
Received: by mail-wm1-x342.google.com with SMTP id l17so3045625wmh.0
 for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Nov 2019 02:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=R4hjhKPyQPWEsWK0HmI2zX8e76pSPH6drX+KAe0V84E=;
 b=prbs1dP81sRgtZ7wMCz80nqk+aX4U4XK85NdUe3WyuZaaGzWb6qcXqMherEtvNOdfQ
 0mFggBF0xyVTaVOrAJi9kBoL3Wz2rHwKRiBtK9dd0Cix8BWDWQTxqphMaHDloq0dR2uW
 cfaEJuWSZRXBi3t8JQ1a9RiTet71dpIlmxSrix9fiPhjr6ViM4JByd+qlWkc1Lw9s6Dn
 MNPXnRbI/U7zcw5K40Cx1EmUwjrSZKUjVf6KH4pEa+ucjPeoQioSZwwvYerH2K54/sZ/
 SB33awdggXTa/GgebY19XswcrwnmF8mLAP9YsQ3US8r9L3ZqbmEsEPGe693crpzqwMIp
 imEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R4hjhKPyQPWEsWK0HmI2zX8e76pSPH6drX+KAe0V84E=;
 b=pK44SWXnkjAfrGW9ujfJ/z1CntdLK2yzSCLM/DZhss7h8CeNgbX3bgaqBMHLpxcZHf
 LIfoFGdrNR/uGJiMwgHzLq0yXCFV6FdGg+HKp1hVos7YN1wTpPhZ4Rcp+uvml/dkQrAZ
 dHd70SbTjK6xpVwIvIAF2q5wxFgoqKZTbWzmWrzXRsAgqQKMvyuDfyOsCOEEfQ0PY7rB
 nqCoDDzhcD52q2w3/JRaZqXs/huLha4dSZUxSdj5xOu2iqr8oxO9i/00QCoAl9A0ilX6
 2IWGMQiDrK/0819XdJWyop+31upUAHnGnYzC+oTyLoWozVgwPn8/A0N0XEitMix2YjQA
 trww==
X-Gm-Message-State: APjAAAU1AIUfrX6ImJ7YWQzmgIWx1o1+l8cRZRP6SMgVv6MSHKapXZsz
 Am3jFW1yvfBecmGtixBF+mE=
X-Google-Smtp-Source: APXvYqwK4BLAl1njfaoGUIR/wJpfPYIvklCz7Cwdpuk+lsOrpbr4tVRvmsBX1oWogL8be666keQqvw==
X-Received: by 2002:a1c:e08a:: with SMTP id x132mr8950374wmg.146.1574330927887; 
 Thu, 21 Nov 2019 02:08:47 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40e1:9900:4082:8c56:ea03:cdcd])
 by smtp.gmail.com with ESMTPSA id y2sm2568116wmy.2.2019.11.21.02.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 02:08:47 -0800 (PST)
Date: Thu, 21 Nov 2019 11:08:23 +0100
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] aspeed: fix snoop_file_poll()'s return type
Message-ID: <20191121100823.2twowr42nsyykvgg@ltop.local>
References: <20191120000647.30551-1-luc.vanoostenryck@gmail.com>
 <787e54c2-2fe3-4afc-a69b-94771726194b@www.fastmail.com>
 <CACPK8XfO=F-BtCuDqyQODJv=6joYmyFiQ5eOYC5YuDJhcLSJtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XfO=F-BtCuDqyQODJv=6joYmyFiQ5eOYC5YuDJhcLSJtw@mail.gmail.com>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Nov 21, 2019 at 02:52:39AM +0000, Joel Stanley wrote:
> On Wed, 20 Nov 2019 at 05:42, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > Looks fine to me as POLLIN and EPOLLIN evaluate to the same value despite
> > the type difference.
> 
> I assume Luc was using sparse to check:
> 
> CHECK   ../drivers/soc/aspeed/aspeed-lpc-snoop.c
> ../drivers/soc/aspeed/aspeed-lpc-snoop.c:112:19: warning: incorrect
> type in initializer (different base types)
> ../drivers/soc/aspeed/aspeed-lpc-snoop.c:112:19:    expected
> restricted __poll_t ( *poll )( ... )
> ../drivers/soc/aspeed/aspeed-lpc-snoop.c:112:19:    got unsigned int (
> * )( ... )
> 
> If you fix the return type:
> 
>   CHECK   ../drivers/soc/aspeed/aspeed-lpc-snoop.c
> ../drivers/soc/aspeed/aspeed-lpc-snoop.c:106:45: warning: incorrect
> type in return expression (different base types)
> ../drivers/soc/aspeed/aspeed-lpc-snoop.c:106:45:    expected restricted __poll_t
> ../drivers/soc/aspeed/aspeed-lpc-snoop.c:106:45:    got int

Yes, but with the change s/POLLIN/EPOLLIN/ this last warning
is not issued.
 
Cheers,
-- Luc
