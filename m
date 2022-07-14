Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE7A5750B8
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Jul 2022 16:26:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkGyg3L4Cz3c5N
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Jul 2022 00:26:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hINe2A+4;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=fercerpav@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hINe2A+4;
	dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LkGyW49Tdz3byv
	for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Jul 2022 00:26:42 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id x10so1904680ljj.11
        for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Jul 2022 07:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xhAdDwR7fkHmP5A2mwh6VjI19vPe0VaNlf9urUpx8Og=;
        b=hINe2A+4rDsO5qx9r85RBNBCkuJYvM+3sJiN3lY76d+aFcYM1FL4AzzIIMEQ9bBstP
         x2a+hNbdWpX2UFWFTcI/JqwAlb2WDj93S/d4pvcbo5HcL1XgKIDXRTmQ3EOJqlp7zmdy
         3f3KsIkym9rNdc6a8ECB66yrOVz1mU473DSP+hIvYFH9+G8MM9Jz7IcY6g81EIt/a4DY
         UwT/Gk78TtX5CsazY8xdZt6M1GwQEdRXMnbR0k2jtlaA0eBQ3kXpZSv67jhIls9uG7gV
         9wGeVkTCuKK3eSr7OpKj60z7aq9iweHaArBIqGtC7AJv405Hs7TDziT573dBeevw3aOh
         VHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xhAdDwR7fkHmP5A2mwh6VjI19vPe0VaNlf9urUpx8Og=;
        b=izq3AFu6EqQfI1QmxkdX366kaqGsrJT6sDDKJwPN86Bfdv+XLi2d0+yKyyAWOWWZsl
         xz0l17Nrvu0CT9fGdtkt9wI3xTzXYr2PK4ZE/qDbfkaZyfwRJ0VK8hI2vJjpPN0o/bC6
         su8csydg8UjGIvA2AcdoiJqFyRIZcd2RcOZfWqnuk8u+EUGQW2ERTcfJq4PSx6EuhG8z
         6Kw9zTFAEeP9DETSLqHSe8jEbia7gZXeQxMokEHoHtQvsKxQ8TZue1DBlc0TNLEsld5v
         Hs3ZjDrqNTjE2hld9EeTIgQdTYZoKw71cTcj0dzkbSuFfG3+FeJ3LIShbL+4soYgNMVT
         HMsQ==
X-Gm-Message-State: AJIora/MJk2cnAqQ9NIt0UInjWUbI/vK7wukp2q1Z/8Ll9t9jkjwwjNT
	NrbQOGJszM5RZynQ8+WsjzI=
X-Google-Smtp-Source: AGRyM1sI1Dl9Qmbe2UutdGzOYC6VzFsKnNHLtcRH+6OjgCWBc6AqXqI2QGNzP6O3eNnhay2PqUfk1g==
X-Received: by 2002:a2e:944a:0:b0:24f:10bd:b7e8 with SMTP id o10-20020a2e944a000000b0024f10bdb7e8mr4980778ljh.238.1657808794231;
        Thu, 14 Jul 2022 07:26:34 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id q17-20020a056512211100b00489c665af61sm382594lfr.274.2022.07.14.07.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 07:26:33 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 26EEQT1u027118;
	Thu, 14 Jul 2022 17:26:31 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 26EEQPC1027117;
	Thu, 14 Jul 2022 17:26:25 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Joel Stanley <joel@jms.id.au>, Patrick Venture <venture@google.com>
Subject: [PATCH] hwmon: (aspeed-pwm-tacho) increase fan tach period (again)
Date: Thu, 14 Jul 2022 17:23:44 +0300
Message-Id: <20220714142344.27071-1-fercerpav@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-hwmon@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Paul Fertser <fercerpav@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The old value allows measuring fan speeds down to about 970 RPM and
gives timeout for anything less than that. It is problematic because it
can also be used as an indicator for fan failure or absence.

Despite having read the relevant section of "ASPEED AST2500/AST2520 A2
Datasheet – V1.7" multiple times I wasn't able to figure out what
exactly "fan tach period" and "fan tach falling point of period" mean
(both are set by the driver from the constant this patch is amending).

Experimentation with a Tioga Pass OCP board (AST2500 BMC) showed that
value of 0x0108 gives time outs for speeds below 1500 RPM and the value
offered by the patch is good for at least 750 RPM (the fans can't spin
any slower so the lower bound is unknown). Measuring with the fans
spinning takes about 30 ms, sometimes down to 18 ms, so about the same
as with the previous value.

This constant was last changed in
762b1e88801357770889d013c5d20fe110d1f456.

Signed-off-by: Paul Fertser <fercerpav@gmail.com>
---
 drivers/hwmon/aspeed-pwm-tacho.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index 3cb88d6fbec0..d11f674e3dc3 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -159,7 +159,7 @@
  * 11: reserved.
  */
 #define M_TACH_MODE 0x02 /* 10b */
-#define M_TACH_UNIT 0x0210
+#define M_TACH_UNIT 0x0420
 #define INIT_FAN_CTRL 0xFF
 
 /* How long we sleep in us while waiting for an RPM result. */
-- 
2.32.0

