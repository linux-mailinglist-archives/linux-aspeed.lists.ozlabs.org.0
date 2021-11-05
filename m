Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F74445D25
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 02:02:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hlhzv5rwfz2yZ2
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 12:02:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=axm33hmf;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22f;
 helo=mail-lj1-x22f.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=axm33hmf; dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hlhzq0xRmz2xDT
 for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Nov 2021 12:01:58 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id a10so4907063ljk.13
 for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Nov 2021 18:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=79ZKQZn6O1IkafVjDwZ+j3jAYbT2DQtY9V0AzRB5LOE=;
 b=axm33hmfgPNDbFW8M7zbtqsr9jCWF/3lTmgL2TTu2T0wBTNKmAot9PMmut8/Gn1Fff
 5SFieg25LBaoEwbIQIqlx7qBBoa7jp2W0t+CgaPpt3i4GjFiqahCdSwobYV9l7AkAkT2
 8He3HEpsgFMVLDflbpIVIkfMapMOpA5/P/KPEyn1YhmP46te/eb5BDYvh5/qkQWR0AE3
 TPr8zqd7qb8rpt0zZHxNcZn2p1X3IJ6SebfSqI9u57tM1wPvuNZA6E0M7K3dz6Zj+1wL
 zZ5f+2qV6pgCRthgDMbzfL86NoG/gDBtiGmi4B4GsGRaLwqCNX3+YuZzx3g4bYcCTrY0
 Nr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=79ZKQZn6O1IkafVjDwZ+j3jAYbT2DQtY9V0AzRB5LOE=;
 b=6DyjLeOpH4YHuZjJ5Xc1YvkGwi0ZjBqWhjhcXRDZd/8UXJobr/WqDOK/hclRZydNCd
 i9h0V13CYz2q1O9c7extnCUpxxxrPdYAkcmMTl6TYkVYXG4xlSg41TylgloG4EjHynJT
 DMfZazCGVga/T8TvXf+tMVY86SSJTb+AP8MzsXjeKA+loUwNMEdfqrN/v70dU8/YOUz0
 3GPf9XqSfkigVaGJD8Mla1P6A0RjsxaJ26TyjiUvbhHCz4pfn4Pi1+ktIMRzXlpPaQ9H
 SourUDZTYunsiP3kJMrc5nfUeGJRuPVkvGPZX1to6Ku0ciRpMscVUsSGCqSu1eYPr+pE
 AHEw==
X-Gm-Message-State: AOAM532ACqKnkDcd2Rf40OgXR0itI86VZTuRmiNo9HBh9OCY9GIki2X2
 1MSMFn7sV+4lFbIxmJTw+wBcFxzpzCf5rYMXxSs4DQ==
X-Google-Smtp-Source: ABdhPJwdiE12gp4pr+/pTmBIp1OutEv7sqvDKuwDARDTCB2kQkZPfuDkOicHQjBYUEqEn73iODSbdC7q9FPi2Lj6REc=
X-Received: by 2002:a2e:986:: with SMTP id 128mr12328634ljj.253.1636074111609; 
 Thu, 04 Nov 2021 18:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211104210914.4160448-1-osk@google.com>
 <CACPK8XfXuU4i4khbpo8rxqxT9zz021N_m=s8uinoT+nHbCa_Yg@mail.gmail.com>
In-Reply-To: <CACPK8XfXuU4i4khbpo8rxqxT9zz021N_m=s8uinoT+nHbCa_Yg@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Thu, 4 Nov 2021 21:01:35 -0400
Message-ID: <CABoTLcQkds=-RjoY+fTVKyR1r+7Axb2-kFC7DiqMcEQTtJgk6g@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: tyan-s7106: Update nct7802 config
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
Cc: Rob Herring <robh+dt@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Joel

> > +               channel@0 { /* LTD */
> > +                       reg = <0>;
> > +                       status = "okay";
>
> The status = "okay" should be redundant; as long as  you don't specify
> a status, a node is assumed to be enabled.

My apologies! I know you mentioned something similar for the DTS
binding patch. I didn't realize that this was a generic statement,
rather than limited to the example in the binding. Fixed in PATCH v2.

Oskar.
