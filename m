Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ACC4AB539
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Feb 2022 07:54:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JscLz4GDLz3bN6
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Feb 2022 17:54:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=i0DZqUdf;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=i0DZqUdf; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jsc1n6sThz2x9D
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Feb 2022 17:39:23 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id
 v13-20020a17090ac90d00b001b87bc106bdso5479846pjt.4
 for <linux-aspeed@lists.ozlabs.org>; Sun, 06 Feb 2022 22:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=90XO5j4SSi21MWkXg4eItPBZYaK9KTBYZP48f+183o4=;
 b=i0DZqUdfdLyhAKlEgh+PGwJ7phDr5iQAosAX9Rasiie7jUMZVPiw3XZ8WXRQnaRTr/
 FhY4t69rFHxemXszxR5ixemlFPFNzGX1EctCHIq11qw8vPBshMobVguy5hyliUucXKa9
 w5hVm7cKg85ZG2XIm3Ww3rOnY3+GL3EwYOQwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=90XO5j4SSi21MWkXg4eItPBZYaK9KTBYZP48f+183o4=;
 b=5bl9exYylsA1Ue4mpkdm+Vd34y7GwULkzBSO9RNIXPgb/Byo2RsuWXgxxB3SbEPUwd
 azWmdx0J5onkx6IuSJoA9RDs/qx52FPTDyG/Ku1kLmIzLG2boz4z6jRCRNAHeW7fuCNt
 P6f6fqCH9dL7/1DCXrVC2JC0AIawlper9PkbyRIZUxJR5Ydit4ADYr+4H2bru3mZvG3T
 BS3/LB3gQjiZDkggYkiPtLLSmKioMzAjjn8xib8dvQlMp3qm+ZElOKDKbJ/8y8o+YMI9
 nWLF3JyuIH6mpN9264Z5XZjZ28yV6DhWdZRpDe2lOhc5tlKqKuk1liIixTYnKXGladdD
 5URA==
X-Gm-Message-State: AOAM53373rp3WokskPwTR0PkBu7BWtpFOt5NdNFd0WA6airwoyir3qvP
 hYEd/PHzvinGOBlFBUjhn7GEOA==
X-Google-Smtp-Source: ABdhPJzgL04N5Buz1tFGttNAZt5XY/2MMNztRGg7wk0/gdE/g5HEPJJ0QaDB+q1tFkDtBWWwXOFS9w==
X-Received: by 2002:a17:90a:4544:: with SMTP id
 r4mr12463872pjm.186.1644215960965; 
 Sun, 06 Feb 2022 22:39:20 -0800 (PST)
Received: from localhost ([2001:4479:e300:600:88d8:e74b:308:eac6])
 by smtp.gmail.com with ESMTPSA id q2sm11190359pfj.94.2022.02.06.22.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 22:39:20 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: joel@jms.id.au
Subject: Re: [PATCH v2 1/3] firmware: Add boot information to sysfs
Date: Mon,  7 Feb 2022 17:39:15 +1100
Message-Id: <20220207063915.2079738-1-dja@axtens.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220203115344.267159-2-joel@jms.id.au>
References: <20220203115344.267159-2-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 07 Feb 2022 17:54:16 +1100
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
Cc: arnd@arndb.de, linux-aspeed@lists.ozlabs.org, rafael@kernel.org,
 gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Daniel Axtens <dja@axtens.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi,

I really like this design.

Currently on powerpc, a user wanting to check if firmware was
configured to boot with secure boot has to understand both OpenPower
and PowerVM secure boot. On OpenPower they need to check for the
presence of a device-tree property. If they're on PowerVM they need to
decode a different device-tree property and check it's 2 or
greater. Of course, it's not stored as ASCII, it's \x02. And it's
stored big-endian too.

So if powerpc implemented this infrastructure, it would provide users
with one single place to look, and it would represent the value as
ASCII. All very lovely, and it would simplify some scripts enormously.

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel
